import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
            style: TextStyle(color: Colors.black.withOpacity(0.8)),
          ),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.only(
              top: 70,
              right: 100,
              left: 100,
            ),
            child: Column(children: [
              SizedBox(
                height: 80,
              ),
              Container(
                  height: 70,
                  width: 100,
                  color: Colors.white10,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 200,
                    height: 250,
                  )),
              SizedBox(
                height: 0,
              ),
              Text(
                "BookStoreApp",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange.withOpacity(0.8)),
              ),
            ]),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              height: 60,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.white10,
                  offset: const Offset(0.0, 1.0),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                )
              ]),
              child: TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.orange,
                focusNode: _focusNode,
                decoration: InputDecoration(
                    labelText: "Mobile Number",
                    labelStyle:
                        TextStyle(color: Colors.orange.withOpacity(0.8)),
                    contentPadding: EdgeInsets.fromLTRB(20, 20, 30, 20),
                    hintText: "Enter your phone number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal()),
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.orange,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: _focusNode.hasFocus
                                ? Colors.orange
                                : Colors.orange))),
              )),
          FlatButton(
            onPressed: () {},
            child: Container(
              width: 260,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(),
              child: Text(
                "Submit",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w700),
              ),
            ),
            color: Colors.orangeAccent,
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: RichText(
            text: TextSpan(
                text: 'Don\'t have an account?',
                style: TextStyle(color: Colors.black, fontSize: 15),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Sign up',
                      style: TextStyle(color: Colors.orange, fontSize: 15))
                ]),
          ))
        ]));
  }
}
