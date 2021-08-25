import 'dart:ui';

import 'package:book_store_app/screens/login%20.dart';
import 'package:book_store_app/utils/firebase_crud.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:phone_number/phone_number.dart';

class SignUpPage extends StatefulWidget {
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  FocusNode _focusNode = FocusNode();
  bool visiblity = false;

  void validate() async {
    if (formkey.currentState!.validate()) {
      print("ok");
    } else {
      print("Error");
    }
  }

  String? textValidate(value) {
    if (value.isEmpty) {
      return "Text Expected";
    } else {
      return null;
    }
  }

  TextEditingController _firstName = TextEditingController();
  TextEditingController _emailId = TextEditingController();
  TextEditingController _passward = TextEditingController();
  TextEditingController _phoneNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "SignUp",
            style: TextStyle(color: Colors.black.withOpacity(0.8)),
          ),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: 40,
          ),
          Container(
              height: 60,
              width: 200,
              color: Colors.white10,
              child: Image.asset(
                "assets/images/logo.png",
                width: 200,
                height: 60,
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            "BookStoreApp",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.orange.withOpacity(0.8)),
          ),
          Container(
              //child: SingleChildScrollView(
              //  scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: Center(
                child: Form(
                    autovalidate: true,
                    key: formkey,
                    child: Column(children: [
                      Padding(padding: EdgeInsets.all(20)),
                      TextFormField(
                        controller: _firstName,
                        cursorColor: Colors.orange,
                        validator: textValidate,
                        decoration: InputDecoration(
                            labelText: 'First Name',
                            labelStyle: TextStyle(color: Colors.orangeAccent),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: _focusNode.hasFocus
                                        ? Colors.orange
                                        : Colors.orange)),
                            suffixIcon: Icon(
                              Icons.person,
                              color: Colors.orange,
                            )),
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailId,
                         cursorColor: Colors.orange,
                        decoration: InputDecoration(
                          labelText: 'EmailId',
                          labelStyle: TextStyle(color: Colors.orangeAccent),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal()),
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.orange,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: _focusNode.hasFocus
                                      ? Colors.orange
                                      : Colors.orange)),
                        ),
                        validator: MultiValidator([
                          EmailValidator(errorText: "Please enter valid Email"),
                          RequiredValidator(errorText: "Valid Email Expected"),
                        ]),
                      ),
                      Padding(padding: EdgeInsets.all(15)),
                      TextFormField(
                          obscureText: !visiblity,
                          controller: _passward,
                           cursorColor: Colors.orange,
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
                          validator: MinLengthValidator(6,
                              errorText: "Should be atleat 6 charectors")),
                      Padding(padding: EdgeInsets.all(15)),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _phoneNo,
                           cursorColor: Colors.orange,
                          decoration: InputDecoration(
                              labelText: 'Phone Number',
                              prefixText: "+91 ",
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
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Your Mobile Number";
                            } else {
                              return null;
                            }
                          }),
                    ])),
              )),
          Padding(padding: EdgeInsets.all(15)),
          RaisedButton(
            child: Text(
              "Register Now",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.9),
                  fontWeight: FontWeight.w700),
            ),
            padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
            color: Colors.orange.withOpacity(0.8),
            onPressed: () async {
              validate();
              await DataBase.addItem(
                      firstName: _firstName.text,
                      emailId: _emailId.text,
                      password: _passward.text,
                      phoneNo: _phoneNo.text)
                  .whenComplete(() => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage())));
            },
          )
        ])));
  }
}
