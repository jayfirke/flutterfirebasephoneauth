import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/startscreen//lib/start_page_widget/start_page_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    home: StartPageWidget(),
    debugShowCheckedModeBanner: false,
  ));
}