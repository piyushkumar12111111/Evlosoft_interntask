import 'package:flutter/material.dart';

import '../../resources/components/textFields/text_field.dart';
import '../../resources/components/textFields/text_fields_2.dart';
import 'controller/authcontroller.dart';
import 'otpscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  AuthService _authService = AuthService();
 

final TextEditingController _phoneNumberController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = "";

  void _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneNumberController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        Fluttertoast.showToast(
            msg:
                "Phone number automatically verified and user signed in: ${_auth.currentUser?.uid}");
      },
      verificationFailed: (FirebaseAuthException e) {
        Fluttertoast.showToast(
            msg: "Failed to verify phone number: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        Fluttertoast.showToast(
            msg: "Verification code sent to the phone number");
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "We'll send you a code- it keeps us keep\nyour account secure",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFields2(
              controller: _phoneNumberController,
              hintText: "Phone Number",
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(350, 50),
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                _verifyPhoneNumber();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OtpScreen(
                            phonenumber: _phoneNumberController.text,
                            verificationId: _verificationId,
                          )),
                );
              },
              child: Text(
                "Send Code",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "OR",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23.0, right: 23, top: 20),
              child: GestureDetector(
                onTap: () {
                  _authService.signInWithGoogle(context);
                },
                child: Container(
                  width: 327,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/PNG/image 3.png",
                        width: 25,
                        height: 25,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Sign In with Google",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
