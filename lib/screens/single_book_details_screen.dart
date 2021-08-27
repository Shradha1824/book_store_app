import 'dart:ui';

import 'package:book_store_app/models/books.dart';
import 'package:flutter/material.dart';

class SingleBookPage extends StatelessWidget {
  final Books books;

  const SingleBookPage({Key? key, required this.books}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
        ),
        body: Column(children: [
          //Text(image),
          Container(
              margin: EdgeInsets.only(top: 50, right: 15, left: 15, bottom: 15),
              width: 400,
              height: 250,
              //color: Colors.blue,
              padding: EdgeInsets.only(left: 10, bottom: 15, right: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 170,
                            width: 170,
                            // child: Image.asset(image),
                          ),
                          //Text(title),
                        ]),
                    //Text(author),
                    //Text(price),
                    RaisedButton(
                      onPressed: () {},
                      child: Text("PLACE ORDER",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      color: Colors.orangeAccent,
                    ),
                  ])),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            padding: EdgeInsets.all(20),
            width: 400,
            height: 60,
            child: Text(
              "Customer Details",
              style: TextStyle(color: Colors.black.withOpacity(0.8)),
            ),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            padding: EdgeInsets.all(20),
            width: 400,
            height: 60,
            child: Text(
              "Order Summery",
              style: TextStyle(color: Colors.black.withOpacity(0.8)),
            ),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
          )
        ]));
  }
}
