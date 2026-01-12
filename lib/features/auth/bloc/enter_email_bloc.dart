import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ridge_fin/features/auth/repositories/auth_repository.dart';

part 'enter_email_bloc.freezed.dart';

// ============================================
// STATE
// ============================================
@freezed
class EnterEmailState with _$EnterEmailState {
  const factory EnterEmailState.initial() = _Initial;
  const factory EnterEmailState.loading() = _Loading;
  const factory EnterEmailState.userExists(String email) = _UserExists;
  const factory EnterEmailState.userNotFound(String email) = _UserNotFound;
  const factory EnterEmailState.error(String message) = _Error;
}

// ============================================
// EVENTS
// ============================================
abstract class EnterEmailEvent extends Equatable {
  const EnterEmailEvent();

  @override
  List<Object?> get props => [];
}

class CheckEmailExists extends EnterEmailEvent {
  final String email;

  const CheckEmailExists(this.email);

  @override
  List<Object?> get props => [email];
}

// ============================================
// BLOC
// ============================================
class EnterEmailBloc extends Bloc<EnterEmailEvent, EnterEmailState> {
  final AuthRepository _authRepository;

  EnterEmailBloc(this._authRepository) : super(const EnterEmailState.initial()) {
    on<CheckEmailExists>(_onCheckEmailExists);
  }

  Future<void> _onCheckEmailExists(
    CheckEmailExists event,
    Emitter<EnterEmailState> emit,
  ) async {
    emit(const EnterEmailState.loading());

    try {
      final exists = await _authRepository.checkUserExists(event.email);

      if (exists) {
        emit(EnterEmailState.userExists(event.email));
      } else {
        emit(EnterEmailState.userNotFound(event.email));
      }
    } catch (e) {
      emit(const EnterEmailState.error('Failed to check email'));
    }
  }
}
