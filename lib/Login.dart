import 'dart:ui';

import 'package:bjmoviesmockup_hci_lab/Home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final username = TextEditingController();
  final password = TextEditingController();

  clearUsername() {
    username.clear();
  }

  clearPassword() {
    password.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 150.0),
        child: Center(
          child: Form(
            autovalidate: true,
            key: formkey,
            child: Column(
              children: [
                //Username
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black54, width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black54, width: 1.0)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 1.0)),
                      hintText: 'Username'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return '* Required Username';
                    } else if (value.contains(' ')) {
                      return '* Username can\' Be Contained \" \"';
                    } else if (value.length < 5 || value.length > 20) {
                      return '* Username Length Must Be 5-20 Characters';
                    } else
                      return null;
                  },
                ),
                //Password
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black54, width: 1.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black54, width: 1.0)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0)),
                        hintText: 'Password'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '* Required Password';
                      } else
                        return null;
                    },
                  ),
                ),
                //Button Login
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: RaisedButton(
                    hoverColor: Colors.white,
                    color: Colors.red[400],
                    onPressed: () {
                      if (formkey.currentState.validate()) {
                        print("Validation Complete");
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                Home(username: username.text)));
                      } else
                        print("Validation Not Complete");
                    },
                    child:
                        Text('LOG IN', style: TextStyle(color: Colors.white)),
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
