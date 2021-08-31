import 'dart:ui';

import 'package:book_store_app/models/books.dart';
import 'package:book_store_app/screens/bookdetails/order_placed_successfully.dart';
import 'package:book_store_app/utils/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import 'card_counter.dart';

class OrderSummery extends StatefulWidget {
  final Books books;
  final String name;
  final String phoneNo;
  final String pincode;
  final String locality;
  final String address;
  final String city;
  final String landmark;
  const OrderSummery(
      {Key? key,
      required this.books,
      required this.name,
      required this.phoneNo,
      required this.pincode,
      required this.locality,
      required this.address,
      required this.city,
      required this.landmark})
      : super(key: key);

  OrderSummeryState createState() => OrderSummeryState();
}

class OrderSummeryState extends State<OrderSummery> {
  final databaseReference = FirebaseFirestore.instance;
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    getData();
    getDocument();
  }

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(allData);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              margin: EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 15),
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
                              widget.books.image,
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
                                  widget.books.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                Text(
                                  widget.books.author,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                Text(
                                  "Rs. ${widget.books.price}",
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
                        ])
                  ])),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 460,
              margin: EdgeInsets.only(right: 15, left: 15, bottom: 15),
              padding:
                  EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Customer Details",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 15),
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Edit',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.pop(context)),
                          )
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              height: 50,
                              width: width / 2.39,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border:
                                      Border.all(color: Colors.grey.shade500)),
                              child: Text(widget.name)),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              padding: EdgeInsets.all(15),
                              height: 50,
                              width: width / 2.39,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border:
                                      Border.all(color: Colors.grey.shade500)),
                              child: Text(widget.phoneNo)),
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              height: 50,
                              width: width / 2.39,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border:
                                      Border.all(color: Colors.grey.shade500)),
                              child: Text(widget.pincode)),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              padding: EdgeInsets.all(15),
                              height: 50,
                              width: width / 2.39,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border:
                                      Border.all(color: Colors.grey.shade500)),
                              child: Text(widget.locality)),
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: width,
                      height: 100,
                      child: Text(widget.address),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey.shade500)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              height: 50,
                              width: width / 2.39,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border:
                                      Border.all(color: Colors.grey.shade500)),
                              child: Text(widget.city)),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              padding: EdgeInsets.all(15),
                              height: 50,
                              width: width / 2.39,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border:
                                      Border.all(color: Colors.grey.shade500)),
                              child: Text(widget.landmark)),
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Type",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 15)),
                      ],
                    ),
                    Circle(),
                  ]),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400)),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 15),
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
                            "Order Summery",
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
                              widget.books.image,
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
                                  widget.books.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                Text(
                                  widget.books.author,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                Text(
                                  "Rs. ${widget.books.price}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                CardCounter(),
                              ])
                        ]),
                    RaisedButton(
                        color: Colors.orangeAccent,
                        onPressed: () async {
                          await DataBase.readItem();
                          // saveAddress();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderSuccessFully(
                                        address: widget.address,
                                        phoneno: widget.phoneNo,
                                      )));
                        },
                        child: Text(
                          "CHECKOUT",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )),
                  ]),
            )
          ])
        ])));
  }

  getDocument() {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async {
        print(doc["phoneNo"]);
        print(doc.id);
      });
    });
  }
}

class Circle extends StatefulWidget {
  @override
  CircleState createState() => CircleState();
}

class CircleState extends State<Circle> {
  bool circle1 = false;
  bool circle2 = false;
  bool circle3 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                circle1 = !circle1;
              });
            },
            icon: circle1
                ? Icon(
                    Icons.circle_rounded,
                  )
                : Icon(Icons.circle_outlined)),
        Text("Home"),
        SizedBox(
          width: 10,
        ),
        IconButton(
            onPressed: () {
              setState(() {
                circle2 = !circle2;
              });
            },
            icon: circle2
                ? Icon(Icons.circle_rounded)
                : Icon(Icons.circle_outlined)),
        Text("Work"),
        SizedBox(
          width: 10,
        ),
        IconButton(
            onPressed: () {
              setState(() {
                circle3 = !circle3;
              });
            },
            icon: circle3
                ? Icon(Icons.circle_rounded)
                : Icon(Icons.circle_outlined)),
        Text("Others"),
      ],
    );
  }
}
