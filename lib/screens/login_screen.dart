import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatelessWidget {
  void onLoginSuccess(BuildContext context) {
    // Step 3: Replace the navigation stack after successful login
    Navigator.pushReplacementNamed(context, '/home');
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // User is signed in with Google
        // Navigate to the home screen or perform further actions
      }
    } catch (error) {
      // Handle sign-in error
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        // User is signed in with Facebook
        // Navigate to the home screen or perform further actions
      }
    } catch (error) {
      // Handle sign-in error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 48.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement signup logic here
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Login'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: _signInWithGoogle,
              icon: Icon(Icons.login),
              label: Text('Sign in with Google'),
            ),
            SizedBox(height: 12.0),
            ElevatedButton.icon(
              onPressed: _signInWithFacebook,
              icon: Icon(Icons.facebook),
              label: Text('Sign in with Facebook'),
            ),
            SizedBox(height: 24.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }
}
