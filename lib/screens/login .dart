import 'dart:ui';

import 'package:book_store_app/screens/otp.dart';
import 'package:book_store_app/screens/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:phone_number/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  FocusNode _focusNode = FocusNode();

  String? NumberValidate(value) {
    if (value.isEmpty) {
      return "Text Expected";
    } else {
      return null;
    }
  }

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
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
                    width: 120,
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
                    controller: _controller,
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
                          Icons.call,
                          color: Colors.orange,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: _focusNode.hasFocus
                                    ? Colors.orange
                                    : Colors.orange))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Mobile Number";
                      }
                    })),
            FlatButton(
              onPressed: () {
                NumberValidate("");
                String phoneNumber = _controller.text;
                FirebaseFirestore.instance
                    .collection('users')
                    .get()
                    .then((QuerySnapshot querySnapshot) {
                  querySnapshot.docs.forEach((docs) async {
                    if (docs['phoneNo'] == _controller.text) {
                      print("Login Successfully");
                    } else {
                      print("First you need to register");
                    }
                    if (phoneNumber != null) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('phoneNumber', phoneNumber);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              OtpVerificationPage(_controller.text)));
                    } else {
                      print("Give your phone number");
                    }
                  });
                });
              },
              child: Container(
                width: 260,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(),
                child: Text(
                  "Submit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
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
                          text: ' Sign up',
                          style: TextStyle(color: Colors.orange, fontSize: 15),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            })
                    ]),
              ),
            )
          ],
        )));
  }
}
