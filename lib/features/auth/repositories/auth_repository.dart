import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ridge_fin/features/auth/models/user_model.dart';

@lazySingleton
class AuthRepository {
  final SupabaseClient _supabase;

  AuthRepository(this._supabase);

  Future<bool> checkUserExists(String email) async {
    try {
      final response = await _supabase.from('profiles').select('id').eq('email', email).maybeSingle();

      return response != null;
    } catch (e) {
      throw Exception('Failed to check user: $e');
    }
  }

  Future<UserModel> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final authResponse = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'first_name': firstName,
          'last_name': lastName,
        },
      );

      if (authResponse.user == null) {
        throw Exception('Registration failed');
      }

      final user = authResponse.user!;

      return UserModel(
        id: user.id,
        email: user.email!,
        firstName: firstName,
        lastName: lastName,
        createdAt: DateTime.parse(user.createdAt),
      );
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final authResponse = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (authResponse.user == null) {
        throw Exception('Login failed');
      }

      final user = authResponse.user!;

      final profileData = await _supabase.from('profiles').select().eq('id', user.id).single();

      return UserModel(
        id: user.id,
        email: user.email!,
        firstName: profileData['first_name'],
        lastName: profileData['last_name'],
        createdAt: DateTime.parse(user.createdAt),
      );
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) return null;

      final profileData = await _supabase.from('profiles').select().eq('id', user.id).single();

      return UserModel(
        id: user.id,
        email: user.email!,
        firstName: profileData['first_name'],
        lastName: profileData['last_name'],
        createdAt: DateTime.parse(user.createdAt),
      );
    } catch (e) {
      return null;
    }
  }

  bool get isAuthenticated => _supabase.auth.currentUser != null;
}
