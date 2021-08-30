import 'package:book_store_app/constance/body_screen.dart';
import 'package:book_store_app/screens/home/components/body.dart';
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
                                      ? Colors.grey.shade600
                                      : Colors.grey.shade500))),
                    ))),
            SizedBox(
              width: 10,
            ),
            Card(
                elevation: 6,
                color: Colors.orangeAccent,
                child: Icon(Icons.shopping_cart_outlined)),
            SizedBox(
              width: 10,
            ),
            Card(
              elevation: 6,
              color: Colors.orangeAccent,
              child: Icon(Icons.favorite_outline)
            )
          ],
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Body(),
    );
  }
}
