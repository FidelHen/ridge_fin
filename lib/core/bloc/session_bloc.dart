import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ridge_fin/features/auth/models/user_model.dart';
import 'package:ridge_fin/features/auth/repositories/auth_repository.dart';

part 'session_bloc.freezed.dart';

// ============================================
// STATE
// ============================================
@freezed
class SessionState with _$SessionState {
  const factory SessionState.initial() = _Initial;
  const factory SessionState.loading() = _Loading;
  const factory SessionState.authenticated({
    required UserModel user,
  }) = _Authenticated;
  const factory SessionState.unauthenticated() = _Unauthenticated;
}

// ============================================
// EVENTS
// ============================================
abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object?> get props => [];
}

class CheckAuthStatus extends SessionEvent {
  const CheckAuthStatus();
}

class UserLoggedIn extends SessionEvent {
  final UserModel user;

  const UserLoggedIn(this.user);

  @override
  List<Object?> get props => [user];
}

class UserLoggedOut extends SessionEvent {
  const UserLoggedOut();
}

// ============================================
// BLOC
// ============================================
@singleton
class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final AuthRepository _authRepository;

  SessionBloc(this._authRepository) : super(const SessionState.initial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<UserLoggedIn>(_onUserLoggedIn);
    on<UserLoggedOut>(_onUserLoggedOut);
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<SessionState> emit,
  ) async {
    emit(const SessionState.loading());

    try {
      final user = await _authRepository.getCurrentUser();

      if (user != null) {
        emit(SessionState.authenticated(user: user));
      } else {
        emit(const SessionState.unauthenticated());
      }
    } catch (e) {
      emit(const SessionState.unauthenticated());
    }
  }

  void _onUserLoggedIn(
    UserLoggedIn event,
    Emitter<SessionState> emit,
  ) {
    emit(SessionState.authenticated(user: event.user));
  }

  Future<void> _onUserLoggedOut(
    UserLoggedOut event,
    Emitter<SessionState> emit,
  ) async {
    try {
      await _authRepository.signOut();
      emit(const SessionState.unauthenticated());
    } catch (e) {
      emit(const SessionState.unauthenticated());
    }
  }
}
