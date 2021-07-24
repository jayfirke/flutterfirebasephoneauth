/*
*  start_page_widget.dart
*  LoginApp
*
*  Created by Jay Firke.
*  Copyright © 2021 Firke. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:login_app/startscreen//lib/values/values.dart';
import 'package:login_app/verifyphonescreen/lib/verify_phone_widget/verify_phone_widget.dart';


class StartPageWidget extends StatelessWidget {

  void onNextPressed(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyPhoneWidget()));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 44,
                height: 44,
                margin: EdgeInsets.only(left: 173, top: 122),
                child: Image.asset(
                  "",
                  fit: BoxFit.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Text(
                "Please select your language",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Arial",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              width: 323,
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "You can change the langauge at any time",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryText,
                  fontFamily: "Arial",
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                ),
              ),
            ),
            Align(
              child: Container(
                width: 216,
                height: 48,
                margin: EdgeInsets.only(top: 206),
                child: FlatButton(
                  onPressed: () => this.onNextPressed(context),
                  color: Color.fromARGB(255, 46, 59, 98),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  textColor: Color.fromARGB(255, 255, 255, 255),
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "NEXT",
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
            ),
          ],
        ),
      ),
    );
  }
}