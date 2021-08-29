import 'package:flutter/material.dart';

class OrderSuccessFully extends StatefulWidget {
  @override
  OrderSuccessFullyState createState() => OrderSuccessFullyState();
}

class OrderSuccessFullyState extends State<OrderSuccessFully> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            SizedBox(
              height: 300,
            ),
            Row(children: [
              Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 60,
                  width: width / 1.07,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade500)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Email us",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Contacts",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Adress",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ))
            ]),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                    padding: EdgeInsets.only(top: 10),
                    height: 80,
                    width: width / 3.2,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade500)),
                    child: Text("admin@bookstore.com")),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 80,
                  width: width / 3.2,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade500)),
                  child: Text("+91-8722893756"),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 80,
                  width: width / 3.2,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade500)),
                  child:
                      Text("42,14th Main Road near Hanuman Temple, Benglore"),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            RaisedButton(
              color: Colors.orangeAccent,
              onPressed: () {},
              child: Text("CONTINUE SHOPPING",
                  style: TextStyle(color: Colors.white)),
            )
          ]),
        ),
      ),
    );
  }
}
