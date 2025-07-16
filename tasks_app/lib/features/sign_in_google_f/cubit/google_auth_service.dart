import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleAuthService {
  static const String baseUrl = 'https://0ccc-149-102-244-104.ngrok-free.app';

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId:
        '58063317011-7eo6grk2edhj18ujldbgal6vvdj7v63p.apps.googleusercontent.com',
    //'58063317011-eqh5vvjbf1cigt8tg7mkbp3nqi3rodts.apps.googleusercontent.com',
    scopes: ['email', 'profile'],
  );
  GoogleSignInAccount? currentUser;
  String? accessToken;
  String? refreshToken;

  Future<Map<String, dynamic>> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) throw Exception('Google sign-in aborted.');

    final GoogleSignInAuthentication auth = await googleUser.authentication;

    final response = await http.post(
      Uri.parse('$baseUrl/auth/google/app'),
      headers: {'Content-Type': 'application/json'},
      //  body: jsonEncode({'idToken': auth.idToken}),
      body: jsonEncode({'token': auth.accessToken}),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      currentUser = googleUser;
      accessToken = data['access_token'];
      refreshToken = data['refresh_token'];
      return {
        'user': data['user'],
        'access_token': accessToken,
        'refresh_token': refreshToken,
      };
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> fetchUserProfile() async {
    if (accessToken == null) throw Exception('Access token not available.');

    final response = await http.get(
      Uri.parse('$baseUrl/users/me'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch profile: ${response.statusCode}');
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    currentUser = null;
    accessToken = null;
    refreshToken = null;
  }
}
