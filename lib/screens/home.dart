import 'package:book_store_app/screens/home/components/body.dart';
import 'package:book_store_app/screens/single_book_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
                child: Container(
                    color: Colors.white,
                    child: TextField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(2),
                          hintText: "Search...",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: _focusNode.hasFocus
                                      ? Colors.white
                                      : Colors.white))),
                    ))),
            SizedBox(
              width: 13,
            ),
            Icon(Icons.shopping_cart_outlined)
          ],
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Body(),
    );
  }
}
