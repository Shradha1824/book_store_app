import 'package:book_store_app/constance/book_display.dart';
import 'package:book_store_app/screens/bookdetails/add_to_card.dart';
import 'package:book_store_app/screens/otp.dart';
import 'package:book_store_app/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home.dart';
import 'screens/login .dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var phoneNumber = prefs.getString('phoneNumber');
  print("Logged user number $phoneNumber");
  runApp(MaterialApp(home: phoneNumber == null ? LoginPage() : Home()));
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white10, // navigation bar color
    statusBarColor: Colors.white10,
    statusBarBrightness: Brightness.light,
    // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
        initialRoute: 'home',
        routes: {
          '/home': (context) => Home(),
          '/signup': (context) => SignUpPage(),
          '/login': (context) => LoginPage(),
          '/otp': (context) => OtpVerificationPage(""),
        });
  }
}
