import 'package:book_store_app/constants.dart';
import 'package:book_store_app/models/book_sort_high_to_low.dart';
import 'package:book_store_app/models/books.dart';
import 'package:book_store_app/models/book_sort_low_to_high.dart';
import 'package:book_store_app/utils/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemCardHighToLow extends StatefulWidget {
  final BookHighToLow bookHighToLow;
  final press;
  const ItemCardHighToLow({
    Key? key,
    required this.bookHighToLow,
    required this.press,
  }) : super(key: key);

  ItemCardHighToLowState createState() => ItemCardHighToLowState();
}

class ItemCardHighToLowState extends State<ItemCardHighToLow> {
  bool favirote = false;
  int numberOfWish = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.press,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                top: kDefaultPadding),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade400)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(widget.bookHighToLow.image),
                SizedBox(
                  height: 5,
                ),
                Text(widget.bookHighToLow.title),
                SizedBox(
                  height: 3,
                ),
                Text("by ${widget.bookHighToLow.author}"),
                SizedBox(
                  height: 3,
                ),
                Text("Rs. ${widget.bookHighToLow.price}"),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  SizedBox(
                      width: 90,
                      height: 30,
                      child: RaisedButton(
                          padding: EdgeInsets.all(10),
                          color: Colors.orangeAccent,
                          child: Text(
                            "ADD TO CARD",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          onPressed: () async {
                            await DataBase.addBooksToCard(
                                    image: widget.bookHighToLow.image,
                                    title: widget.bookHighToLow.title,
                                    author: widget.bookHighToLow.author,
                                    price: widget.bookHighToLow.price,
                                    wishlist: favirote)
                                .whenComplete(() => showInSnackBar(
                                    "Book added in shopping card"));
                          })),
                  wishlist(context)
                ])
              ],
            ),
          ))
        ]));
  }

  void showInSnackBar(String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(value)));
  }

  Widget wishlist(BuildContext context) {
    return SizedBox(
        width: 35,
        height: 40,
        child: IconButton(
            onPressed: () {
              setState(() {
                favirote = !favirote;
                numberOfWish++;
              });
            },
            icon: favirote
                ? Icon(
                    Icons.favorite_rounded,
                    color: Colors.orange,
                  )
                : Icon(
                    Icons.favorite_outline,
                    color: Colors.orange,
                  )));
  }
}
