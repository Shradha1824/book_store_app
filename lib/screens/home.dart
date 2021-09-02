import 'package:book_store_app/constance/body_screen.dart';
import 'package:book_store_app/screens/bookdetails/add_to_card.dart';
import 'package:book_store_app/screens/bookdetails/book_details.dart';
import 'package:book_store_app/screens/home/components/body.dart';
import 'package:book_store_app/screens/home/components/body_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'bookdetails/card_counter.dart';

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
          automaticallyImplyLeading: false,
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
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddToCard()));
                  },
                  icon: Icon(Icons.shopping_cart_outlined)),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))
            ],
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Bodyed());
  }
}
