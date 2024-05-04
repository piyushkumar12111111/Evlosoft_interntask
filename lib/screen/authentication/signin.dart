import 'package:flutter/material.dart';

import '../../resources/components/textFields/text_field.dart';
import '../../resources/components/textFields/text_fields_2.dart';
import 'controller/authcontroller.dart';
import 'otpscreen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  AuthService _authService = AuthService();
  TextEditingController phonecontroller = TextEditingController();
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
              controller: phonecontroller,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OtpScreen(phonenumber: phonecontroller.text)),
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
