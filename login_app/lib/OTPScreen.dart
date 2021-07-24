/*
*  OTPScreen.dart
*  LoginApp
*
*  Created by Jay Firke.
*  Copyright © 2021 Firke. All rights reserved.
    */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/select_profile/lib/select_profile_widget/select_profile_widget.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Color.fromARGB(255, 147, 210, 243),
    borderRadius: BorderRadius.circular(10.0)
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 120),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Verify Phone +91${widget.phone}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Arial",
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Code is sent to mobile number",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 106, 108, 123),
                      fontFamily: "Arial",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PinPut(
              fieldsCount: 6,
              textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
              eachFieldWidth: 48.0,
              eachFieldHeight: 48.0,
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
              onSubmit: (pin) async {
                try {
                  await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(
                      verificationId: _verificationCode, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SelectProfileWidget()),
                              (route) => false);
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  // _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text('invalid OTP')));
                  _scaffoldkey.currentState!.showSnackBar(SnackBar(content: Text("Invalid OTP")));
                }
              },
            ),
          ),
          Text(
            "Didn't receive the code ? Request Again",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromARGB(255, 106, 108, 123),
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 328,
            height: 56,
            // margin: EdgeInsets.only(left: 31, top: 41),
            child: FlatButton(
              onPressed: () => this.onButtonPressed(context),
              color: Color.fromARGB(255, 46, 59, 98),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              textColor: Color.fromARGB(255, 255, 255, 255),
              padding: EdgeInsets.all(0),
              child: Text(
                "VERIFY AND CONTINUE",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: ".SF NS",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SelectProfileWidget()),
                      (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, [resendToken]) async {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 60));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }

  onButtonPressed(BuildContext context) {
    _verifyPhone();
  }
}
