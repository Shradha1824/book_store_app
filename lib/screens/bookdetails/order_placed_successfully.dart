import 'package:book_store_app/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderSuccessFully extends StatefulWidget {
  // final String email;
  final String phoneno;
  final String address;
  const OrderSuccessFully({
    Key? key,
    required this.phoneno,
    required this.address,
    //   required this.email,
  }) : super(key: key);

  @override
  OrderSuccessFullyState createState() => OrderSuccessFullyState();
}

class OrderSuccessFullyState extends State<OrderSuccessFully> {
  void initState() {
    super.initState();
    getDocument();
  }

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
            Padding(padding: EdgeInsets.only(left: 10)),
            SizedBox(
              height: 200,
            ),
            Column(
              children: [
                Text("Order Placed Successfully",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "hurry!!! your order is confirmed",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                  "the order id is #123456 save the order id for",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                  "further communication...",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                )
              ],
            ),
            SizedBox(
              height: 20,
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
                  child: Text(widget.phoneno),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 80,
                  width: width / 3.2,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade500)),
                  child: Text(widget.address),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            RaisedButton(
              color: Colors.orangeAccent,
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text("CONTINUE SHOPPING",
                  style: TextStyle(color: Colors.white)),
            )
          ]),
        ),
      ),
    );
  }

  getDocument() {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["phoneNo"]);
        print(doc.id);
      });
    });
  }
}
