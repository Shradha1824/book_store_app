import 'dart:ui';

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  FocusNode _focusNode = FocusNode();
  bool visiblity = false;

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _passward = TextEditingController();
  TextEditingController _phoneNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Register Page",
            style: TextStyle(color: Colors.black.withOpacity(0.8)),
          ),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: Column(children: [
          SizedBox(
            height: 40,
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
          Container(
              child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 30, right: 30, top: 15),
            child: Form(
                key: formkey,
                child: Column(children: [
                  Padding(padding: EdgeInsets.all(20)),
                  TextFormField(
                    controller: _firstName,
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: TextStyle(color: Colors.orangeAccent),
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
                  ),
                  Padding(padding: EdgeInsets.all(15)),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _lastName,
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.orangeAccent),
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
                  ),
                  Padding(padding: EdgeInsets.all(15)),
                  TextFormField(
                    obscureText: !visiblity,
                    controller: _passward,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.orangeAccent),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal()),
                        suffixIcon: IconButton(
                            icon: Icon(visiblity
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                visiblity = !visiblity;
                              });
                            },
                            color: Colors.orange),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: _focusNode.hasFocus
                                    ? Colors.orange
                                    : Colors.orange))),
                  ),
                  Padding(padding: EdgeInsets.all(15)),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _phoneNo,
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.orangeAccent),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal()),
                        suffixIcon: Icon(
                          Icons.call,
                          color: Colors.orange,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: _focusNode.hasFocus
                                    ? Colors.orange
                                    : Colors.orange))),
                  ),
                ])),
          )),
          Padding(padding: EdgeInsets.all(15)),
          FlatButton(
            onPressed: () {},
            child: Container(
              width: 265,
              margin: EdgeInsets.all(20),
              child: Text(
                "Register Now",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.9),
                    fontWeight: FontWeight.w700),
              ),
            ),
            color: Colors.orange.withOpacity(0.8),
          )
        ]));
  }
}
