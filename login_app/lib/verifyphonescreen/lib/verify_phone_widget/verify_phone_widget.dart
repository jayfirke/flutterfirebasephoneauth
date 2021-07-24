/*
*  verify_phone_widget.dart
*  LoginApp
*
*  Created by Jay Firke.
*  Copyright © 2021 Firke. All rights reserved.
    */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/OTPScreen.dart';
import 'package:login_app/select_profile/lib/select_profile_widget/select_profile_widget.dart';
import 'package:login_app/startscreen/lib/start_page_widget/start_page_widget.dart';

class VerifyPhoneWidget extends StatefulWidget {
  @override
  _VerifyPhoneWidgetState createState() => _VerifyPhoneWidgetState();
}

class _VerifyPhoneWidgetState extends State<VerifyPhoneWidget> {
  TextEditingController _phonenummbercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Please enter your mobile number",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You’ll receive a 4 digit code to verify next",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 106, 108, 123),
                    fontFamily: "Arial",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: 327,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  child: TextField(
                    controller: _phonenummbercontroller,
                    decoration: InputDecoration(
                      hintText: "Mobile Number",
                      prefix: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text('+91'),
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Arial",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    autocorrect: false,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 328,
                  height: 56,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OTPScreen(_phonenummbercontroller.text)));
                    },
                    color: Color.fromARGB(255, 46, 59, 98),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    textColor: Color.fromARGB(255, 255, 255, 255),
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "CONTINUE",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "Arial",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}