import 'package:book_store_app/models/books.dart';
import 'package:book_store_app/screens/bookdetails/book_details.dart';
import 'package:book_store_app/screens/bookdetails/card_counter.dart';
import 'package:book_store_app/screens/home/components/bookview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class AddToCard extends StatefulWidget {
  // final Books? books;
  const AddToCard({
    Key? key,
  }) : super(key: key);

  @override
  _AddToCardState createState() => _AddToCardState();
}

class _AddToCardState extends State<AddToCard> {
  FocusNode _focusNode = FocusNode();

  var index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: [
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
            Container(
                child: Row(
              children: [
                //CardCounters(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))
              ],
            ))
          ]),
          backgroundColor: Colors.orangeAccent,
        ),
        body: StreamBuilder<QuerySnapshot>(
          //pass 'Stream<QuerySnapshot>' to stream
          stream: FirebaseFirestore.instance.collection("cards").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Padding(
                    padding: EdgeInsets.all(0),
                    child: InkWell(
                      child: Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.black54.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1,
                                    spreadRadius: 0.0,
                                    offset: Offset(2.0, 2.0))
                              ]),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 220,
                                  width: 170,
                                  child: Image.network(
                                    doc['image'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: kDefaultPadding,
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: kDefaultPadding,
                                      ),
                                      Text(
                                        doc['title'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.8)),
                                      ),
                                      SizedBox(
                                        height: kDefaultPadding,
                                      ),
                                      Text(
                                        doc['author'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.8)),
                                      ),
                                      SizedBox(
                                        height: kDefaultPadding,
                                      ),
                                      Text(
                                        doc['price'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.8)),
                                      ),
                                      SizedBox(
                                        height: kDefaultPadding,
                                      ),
                                      CardCounter()
                                      //Text(title),
                                    ])
                              ])),
                    ));
              }).toList(),
            );
          },
        ));
  }
}

class CardCounters extends StatefulWidget {
  CardCountersState createState() => CardCountersState();
}

class CardCountersState extends State<CardCounters> {
  int numOfItem = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItem > 1) {
              setState(() {
                numOfItem--;
              });
            }
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Text(numOfItem.toString().padLeft(2, "0"),
              style: TextStyle(
                fontSize: 15,
              )),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItem++;
              });
            })
      ],
    );
  }

  SizedBox buildOutlineButton({required IconData icon, press}) {
    return SizedBox(
        width: 40,
        height: 20,
        child: OutlinedButton(
            onPressed: press,
            child: Icon(
              icon,
              size: 15,
            )));
  }
}
