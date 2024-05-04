import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:interntask/screen/home/homescreen.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        if (userCredential.user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          Get.snackbar('Login Successful', 'You have successfully logged in',
              backgroundColor: Colors.green,
              snackPosition: SnackPosition.BOTTOM);

          print('Login Successful!');
          return userCredential.user;
        }
        return userCredential.user;
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar('Login Failed', 'Please check your email and password',
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
      return null;
    }
    return null;
  }

  void signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
