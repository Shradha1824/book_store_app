import 'package:book_store_app/models/books.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'details/components/card_counter.dart';

class PlaceOrder extends StatelessWidget {
  final Books books;

  const PlaceOrder({Key? key, required this.books}) : super(key: key);
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
                          Container(
                            height: 220,
                            width: 170,
                            child: Image.asset(
                              books.image,
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
                                  books.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                Text(
                                  books.author,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                Text(
                                  "Rs. ${books.price}",
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
              height: 430,
              margin: EdgeInsets.only(right: 15, left: 15, bottom: 15),
              padding:
                  EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(
                        "Customer Details",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 15),
                      )
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Container(
                          height: 50,
                          width: width / 2.35,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                ),
                                border: OutlineInputBorder()),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          height: 50,
                          width: width / 2.35,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Phone Number",
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                ),
                                border: OutlineInputBorder()),
                          ))
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    Row(children: [
                      Container(
                          height: 50,
                          width: width / 2.35,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Pincode",
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                ),
                                border: OutlineInputBorder()),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          height: 50,
                          width: width / 2.35,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Locality",
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                ),
                                border: OutlineInputBorder()),
                          ))
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: width,
                      height: 100,
                      child: TextField(
                          decoration: InputDecoration(
                              hintText: "Address",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(children: [
                      Container(
                          height: 50,
                          width: width / 2.35,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                ),
                                border: OutlineInputBorder()),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          height: 50,
                          width: width / 2.35,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Phone Number",
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                ),
                                border: OutlineInputBorder()),
                          ))
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [Text("Type")],
                    ),
                    Circle()
                  ]),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400)),
            ),
          ]),
        ])));
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
                ? Icon(Icons.circle_rounded)
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