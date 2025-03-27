import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Sign in/Login dengan email dan password
  Future<AuthResponse> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // Sign Up/Daftar dengan email dan password
  Future<AuthResponse> signUp(
    String email, 
    String password,
  ) async {
    return await _supabase.auth.signUp(
      email: email, 
      password: password,
    );
  }

  // Sign Out/Log out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // Dapatkan informasi email user
  String? getCurrentUserEmail() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
