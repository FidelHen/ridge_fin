import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ridge_fin/features/auth/models/user_model.dart';
import 'package:ridge_fin/features/auth/repositories/auth_repository.dart';

part 'login_bloc.freezed.dart';

// ============================================
// STATE
// ============================================
@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(UserModel user) = _Success;
  const factory LoginState.error(String message) = _Error;
}

// ============================================
// EVENTS
// ============================================
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  const LoginSubmitted({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

// ============================================
// BLOC
// ============================================
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(const LoginState.initial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState.loading());

    try {
      final user = await _authRepository.signIn(
        email: event.email,
        password: event.password,
      );

      emit(LoginState.success(user));
    } catch (e) {
      emit(const LoginState.error('Login failed'));
    }
  }
}
