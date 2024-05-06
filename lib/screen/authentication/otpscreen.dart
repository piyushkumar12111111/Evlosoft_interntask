import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interntask/screen/authentication/widgets/otptextfeild.dart';
import 'package:interntask/screen/home/homescreen.dart';

class OtpScreen extends StatefulWidget {
  final String phonenumber;
  final String verificationId;
  const OtpScreen(
      {super.key, required this.phonenumber, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otp = "";

  void _verifyOTP() async {
    Fluttertoast.showToast(msg: "Hello world");
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: _otp,
      );
      Fluttertoast.showToast(msg: "OTP: $_otp");
      print("OTP: $_otp");
      final User? user =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      Fluttertoast.showToast(msg: "Successfully signed in UID: ${user?.uid}");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to verify OTP: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text("Verify OTP"),
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
            child: const Text("Help", style: TextStyle(fontSize: 15)),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "We Just Sent You An SMS Code",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "To login enter the security code we just sent to ${widget.phonenumber}",
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: OTPTextField(
                onCompleted: (String value) {
                  setState(() {
                    _otp = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(350, 50),
                primary: Colors.blue,
              ),
              onPressed: _verifyOTP,
              child: const Text(
                "Verify Code",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
