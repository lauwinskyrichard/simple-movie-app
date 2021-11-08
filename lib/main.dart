import 'dart:ui';

import 'package:bjmoviesmockup_hci_lab/AboutUs.dart';
import 'package:bjmoviesmockup_hci_lab/Home.dart';
import 'package:bjmoviesmockup_hci_lab/Login.dart';
import 'package:bjmoviesmockup_hci_lab/MDetail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'BJ Movies',
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/Home': (context) => Home(),
        '/MDetail': (context) => MDetail(),
        '/AboutUs': (context) => AboutUs()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red[400],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
    ),
  );
}
