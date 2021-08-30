import 'dart:ui';

import 'package:book_store_app/constants.dart';
import 'package:book_store_app/models/books.dart';
import 'package:book_store_app/screens/bookdetails/place_order.dart';
import 'package:flutter/material.dart';

import 'card_counter.dart';

class SingleBookPage extends StatelessWidget {
  final Books? books;

  const SingleBookPage({Key? key, this.books}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              margin: EdgeInsets.only(top: 50, right: 15, left: 15, bottom: 15),
              padding:
                  EdgeInsets.only(left: 15, bottom: 15, right: 15, top: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Card (1)",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          )
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 220,
                            width: 170,
                            child: Image.asset(
                              books!.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: kDefaultPadding,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                Text(
                                  books!.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                Text(
                                  books!.author,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                Text(
                                  "Rs. ${books!.price}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                CardCounter()
                                //Text(title),
                              ])
                        ]),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PlaceOrder(books: books!)));
                      },
                      child: Text("PLACE ORDER",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      color: Colors.orangeAccent,
                    )
                  ])),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 60,
              margin: EdgeInsets.only(right: 15, left: 15, bottom: 15),
              padding: EdgeInsets.all(kDefaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Customer Details",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 15),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400)),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(right: 15, left: 15, bottom: 15),
              padding: EdgeInsets.all(kDefaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Summury",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 15),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400)),
            ),
          ])
        ])));
  }
}
