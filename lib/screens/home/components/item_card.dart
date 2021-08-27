import 'package:book_store_app/constants.dart';
import 'package:book_store_app/models/books.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemCard extends StatelessWidget {
  final Books books;
  final press;
  const ItemCard({
    Key? key,
    required this.books,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade400)),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(books.image),
                SizedBox(
                  height: 2,
                ),
                Text(books.title),
                SizedBox(
                  height: 2,
                ),
                Text("by ${books.author}"),
                SizedBox(
                  height: 2,
                ),
                Text("Rs. ${books.price}"),
                SizedBox(
                  height: 2,
                ),
                Row(children: [
                  RaisedButton(
                      color: Colors.orangeAccent,
                      child: Text(
                        "ADD TO CARD",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      onPressed: () {}),
                  SizedBox(
                    width: 1,
                  ),
                  Image.asset(
                    "assets/images/wishlist.png",
                    width: 30,
                    height: 30,
                  )
                ])
              ],
            ),
          ))
        ]));
  }
}
