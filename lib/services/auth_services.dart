import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static SupabaseClient client() => Supabase.instance.client;

  // LOCAL SAVE EMAIL
  static Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  // LOCAL GET EMAIL
  static Future<String?> getSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  // CLEAR EMAIL (Logout)
  static Future<void> clearEmail() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
  }

  // GOOGLE LOGIN + SUPABASE LOGIN + LOCAL EMAIL SAVE
  static Future<AuthResponse> googleSignIn() async {
    try {
      final GoogleSignIn google = GoogleSignIn(
        scopes: ['email'],
        serverClientId:
        '933016980410-abj247bj0sqkq7d7urvpetm04s703ir2.apps.googleusercontent.com',
      );

      // STEP 1: Start Google Sign-in
      final GoogleSignInAccount? account = await google.signIn();

      if (account == null) {
        throw 'User cancelled Google login';
      }

      // STEP 2: Get Auth Tokens
      final GoogleSignInAuthentication auth = await account.authentication;

      final String? idToken = auth.idToken;
      final String? accessToken = auth.accessToken;

      if (idToken == null) {
        throw 'Google ID Token is null';
      }

      // STEP 3: Save email locally
      await saveEmail(account.email);

      // STEP 4: Login with Supabase
      return await client().auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    } catch (e) {
      rethrow;
    }
  }
}
//
// String? email;
//
// void loadEmail() async {
//   email = await AuthService.getSavedEmail();
//   setState(() {});
// }
