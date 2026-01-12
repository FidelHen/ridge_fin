import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_bloc.freezed.dart';

// State
@freezed
abstract class SessionState with _$SessionState {
  const factory SessionState() = _SessionState;

  const SessionState._();
}
// Events

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object?> get props => [];
}

// Bloc
class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(const SessionState()) {
    on<SessionEvent>((event, emit) {
      emit(const SessionState());
    });
  }
}
