import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ridge_fin/core/bloc/session_bloc.dart';
import 'package:ridge_fin/features/auth/models/user_model.dart';
import 'package:ridge_fin/features/auth/repositories/auth_repository.dart';

import 'session_bloc_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });

  group('SessionBloc', () {
    final testUser = UserModel(
      id: '123',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
    );

    test('initial state is SessionState.initial', () {
      // Arrange & Act
      final bloc = SessionBloc(mockAuthRepository);

      // Assert
      expect(bloc.state, const SessionState.initial());
      bloc.close();
    });

    test('emits [loading, authenticated] when CheckAuthStatus finds a user', () async {
      // Arrange
      when(mockAuthRepository.getCurrentUser()).thenAnswer((_) async => testUser);
      final bloc = SessionBloc(mockAuthRepository);

      // Act
      bloc.add(const CheckAuthStatus());

      // Assert
      await expectLater(
        bloc.stream,
        emitsInOrder([
          const SessionState.loading(),
          SessionState.authenticated(user: testUser),
        ]),
      );
      verify(mockAuthRepository.getCurrentUser()).called(1);
      await bloc.close();
    });

    test('emits [loading, unauthenticated] when CheckAuthStatus finds no user', () async {
      // Arrange
      when(mockAuthRepository.getCurrentUser()).thenAnswer((_) async => null);
      final bloc = SessionBloc(mockAuthRepository);

      // Act
      bloc.add(const CheckAuthStatus());

      // Assert
      await expectLater(
        bloc.stream,
        emitsInOrder([
          const SessionState.loading(),
          const SessionState.unauthenticated(),
        ]),
      );
      verify(mockAuthRepository.getCurrentUser()).called(1);
      await bloc.close();
    });

    test('emits [loading, unauthenticated] when CheckAuthStatus throws an error', () async {
      // Arrange
      when(mockAuthRepository.getCurrentUser()).thenThrow(Exception('Auth error'));
      final bloc = SessionBloc(mockAuthRepository);

      // Act
      bloc.add(const CheckAuthStatus());

      // Assert
      await expectLater(
        bloc.stream,
        emitsInOrder([
          const SessionState.loading(),
          const SessionState.unauthenticated(),
        ]),
      );
      await bloc.close();
    });

    test('emits [authenticated] when UserLoggedIn is added', () async {
      // Arrange
      final bloc = SessionBloc(mockAuthRepository);

      // Act
      bloc.add(UserLoggedIn(testUser));

      // Assert
      await expectLater(
        bloc.stream,
        emits(SessionState.authenticated(user: testUser)),
      );
      await bloc.close();
    });

    test('emits [unauthenticated] when UserLoggedOut is added', () async {
      // Arrange
      when(mockAuthRepository.signOut()).thenAnswer((_) async {});
      final bloc = SessionBloc(mockAuthRepository);

      // Act
      bloc.add(const UserLoggedOut());

      // Assert
      await expectLater(
        bloc.stream,
        emits(const SessionState.unauthenticated()),
      );
      verify(mockAuthRepository.signOut()).called(1);
      await bloc.close();
    });

    test('emits [unauthenticated] when UserLoggedOut throws an error', () async {
      // Arrange
      when(mockAuthRepository.signOut()).thenThrow(Exception('Logout error'));
      final bloc = SessionBloc(mockAuthRepository);

      // Act
      bloc.add(const UserLoggedOut());

      // Assert
      await expectLater(
        bloc.stream,
        emits(const SessionState.unauthenticated()),
      );
      await bloc.close();
    });
  });
}
