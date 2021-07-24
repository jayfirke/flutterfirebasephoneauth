/*
*  select_profile_widget.dart
*  LoginApp
*
*  Created by Jay Firke.
*  Copyright © 2021 Firke. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class SelectProfileWidget extends StatelessWidget {
  late String selectedButton;
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 72),
                child: Text(
                  "PLease select your profile",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "Arial",
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GroupButton(
                isRadio: true,
                spacing: 10,
                buttonWidth: 328,
                buttonHeight: 89,
                buttons: ["Shipper", "Transport"],
                onSelected: (index, isSelected) => {
                  if (index == 0) {
                    selectedButton = "Shipper"
                  } else {
                    selectedButton = "Transport"
                  },
                  print('$index button is selected and the text is ${selectedButton}')
                },
              selectedTextStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.red,
              ),
              unselectedTextStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.grey[600],
              ),
              selectedColor: Colors.white,
              unselectedColor: Colors.grey[300],
              selectedBorderColor: Colors.red,
              unselectedBorderColor: Colors.grey[500],
              borderRadius: BorderRadius.circular(5.0),
              selectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
              unselectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 328,
                height: 56,
                margin: EdgeInsets.only(top: 270),
                child: FlatButton(
                  onPressed: () => {
                    print(selectedButton)
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
            ),
          ],
        ),
      ),
    );
  }
}