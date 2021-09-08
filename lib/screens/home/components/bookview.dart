import 'package:book_store_app/constants.dart';
import 'package:book_store_app/models/books.dart';
import 'package:book_store_app/models/book_sort_low_to_high.dart';
import 'package:book_store_app/utils/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemCard extends StatefulWidget {
  final Books books;
  final press;
  const ItemCard({
    Key? key,
    required this.books,
    required this.press,
  }) : super(key: key);

  ItemCardState createState() => ItemCardState();
}

class ItemCardState extends State<ItemCard> {
  bool favirote = false;
  int numberOfWish = 0;
  int numOfItem = 0;
  bool _addTowish = false;
  bool _addTocard = false;

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
                    Image.asset(widget.books.image),
                    SizedBox(
                      height: 5,
                    ),
                    Text(widget.books.title),
                    SizedBox(
                      height: 3,
                    ),
                    Text("by ${widget.books.author}"),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Rs. ${widget.books.price}"),
                    SizedBox(
                      height: 10,
                    ),
                    _addTowish
                        ? _addedtoWishlist()
                        : Row(children: [
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
                                              image: widget.books.image,
                                              title: widget.books.title,
                                              author: widget.books.author,
                                              price: widget.books.price,
                                              wishlist: favirote)
                                          .whenComplete(() => showInSnackBar(
                                              "Book added in shopping card"));
                                    })),
                            wishlist(context)
                          ]),
                  ]),
            ),
          )
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
                _addTowish = !_addTowish;
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

  Widget _addedtoWishlist() {
    return Row(
      children: [
        SizedBox(
            width: 120,
            height: 30,
            child: RaisedButton(
                color: Colors.white,
                child: Text(
                  "ADDED TO WISH",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                onPressed: () async {
                  SharedPreferences _preferance =
                      await SharedPreferences.getInstance();
                  _preferance.setInt('numberOfWish', numberOfWish);
                  setState(() {
                    _addTowish = !_addTowish;
                    numberOfWish--;
                  });
                })),
      ],
    );
  }

  Widget _addedtoCard() {
    return Row(
      children: [
        SizedBox(
            width: 120,
            height: 30,
            child: RaisedButton(
                color: Colors.white,
                child: Text(
                  "ADDED TO CARD",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                onPressed: () async {
                  SharedPreferences _preferance =
                      await SharedPreferences.getInstance();
                  _preferance.setInt('numberOfWish', numberOfWish);
                  setState(() {
                    _addTocard = !_addTocard;
                    numberOfWish--;
                  });
                })),
      ],
    );
  }
}
