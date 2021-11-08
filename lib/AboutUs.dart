import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Column(
        children: [
          Container(
            height: 70.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 250.0,
              height: 250.0,
              child: Image.asset('assets/logo.png'),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 40.0),
            child: RichText(
              text: TextSpan(
                text: 'Welcome to ',
                style: new TextStyle(fontSize: 20.0, color: Colors.black),
                children: [
                  TextSpan(
                      text: 'BJ Movies.',
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(55.0, 0, 55.0, 20.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: new TextStyle(fontSize: 20.0, color: Colors.black),
                children: [
                  TextSpan(
                      text: 'BJ Movies.',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          'is the most popular app on the web also free. To make more easiest and support fast mobility, '),
                  TextSpan(
                      text: 'BJ Movies ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          'want to create application based on Mobile with the purpose to make it easier for people to find their favorite movies.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
