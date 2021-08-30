import 'dart:ui';

import 'package:book_store_app/models/books.dart';
import 'package:book_store_app/screens/bookdetails/order_summery.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import 'card_counter.dart';

class PlaceOrder extends StatefulWidget {
  final Books books;

  const PlaceOrder({Key? key, required this.books}) : super(key: key);

  PlaceOrderState createState() => PlaceOrderState();
}

class PlaceOrderState extends State<PlaceOrder> {
  String? _customerName;
  String? _customerPn;
  String? _customerPin;
  String? _customerLoc;
  String? _customerAdd;
  String? _customerCity;
  String? _customerLand;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _pinCodeController = TextEditingController();
  TextEditingController _localityController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _landmarkController = TextEditingController();
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
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 50,
                              width: width / 2.39,
                              child: TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                    hintText: "Name",
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                    ),
                                    border: OutlineInputBorder()),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              height: 50,
                              width: width / 2.39,
                              child: TextFormField(
                                controller: _phoneNoController,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 50,
                              width: width / 2.39,
                              child: TextFormField(
                                controller: _pinCodeController,
                                decoration: InputDecoration(
                                    hintText: "Pincode",
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                    ),
                                    border: OutlineInputBorder()),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              height: 50,
                              width: width / 2.39,
                              child: TextFormField(
                                controller: _localityController,
                                decoration: InputDecoration(
                                    hintText: "Locality",
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                    ),
                                    border: OutlineInputBorder()),
                              ))
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: width,
                      height: 100,
                      child: TextField(
                          controller: _addressController,
                          decoration: InputDecoration(
                              hintText: "Address",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ))),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade500)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 50,
                              width: width / 2.39,
                              child: TextFormField(
                                controller: _cityController,
                                decoration: InputDecoration(
                                    hintText: "city/town",
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                    ),
                                    border: OutlineInputBorder()),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              height: 50,
                              width: width / 2.39,
                              child: TextFormField(
                                controller: _landmarkController,
                                decoration: InputDecoration(
                                    hintText: "Landmark",
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
                      children: [
                        Text("Type",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 15)),
                      ],
                    ),
                    Circle(),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      RaisedButton(
                        color: Colors.orangeAccent,
                        onPressed: () {
                          //saveAddress();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderSummery(
                                        books: widget.books,
                                        namesController: _nameController.text,
                                        phoneController:
                                            _phoneNoController.text,
                                        pinCController: _pinCodeController.text,
                                        locController: _localityController.text,
                                        addController: _addressController.text,
                                        citysController: _cityController.text,
                                        landController:
                                            _landmarkController.text,
                                      )));
                        },
                        child: Text(
                          "CONTINUE",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      )
                    ])
                  ]),
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
          ]),
        ])));
  }

  void saveAddress() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("name", _nameController.text);
    sharedPreferences.setString("phoneNumber", _phoneNoController.text);
    sharedPreferences.setString("pincode", _pinCodeController.text);
    sharedPreferences.setString("locality", _localityController.text);
    sharedPreferences.setString("address", _addressController.text);
    sharedPreferences.setString("city", _cityController.text);
    sharedPreferences.setString("landmark", _landmarkController.text);
    setState(() {
      _customerName = sharedPreferences.getString("name");
      _customerPn = sharedPreferences.getString("phoneNumber");
      _customerPin = sharedPreferences.getString("pincode");
      _customerLoc = sharedPreferences.getString("locality");
      _customerAdd = sharedPreferences.getString("address");
      _customerCity = sharedPreferences.getString("city");
      _customerLand = sharedPreferences.getString("landmark");
    });
    print('address saved');
    print(sharedPreferences.getString("name"));
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

  // void storeData()async{
  //   SharedPreferences saveData = await SharedPreferences.getInstance();
  //     saveData.setString(", downloadedUrl);
  // }
}
