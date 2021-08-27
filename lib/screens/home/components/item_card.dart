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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(books.image),
                SizedBox(
                  height: 2,
                ),
                Text(books.title),
                SizedBox(
                  height: 3,
                ),
                Text("by ${books.author}"),
                SizedBox(
                  height: 3,
                ),
                Text("Rs. ${books.price}"),
                SizedBox(
                  height: 3,
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
                          onPressed: () {})),
                  AddFavoriteBooks(),
                ])
              ],
            ),
          ))
        ]));
  }
}

class AddFavoriteBooks extends StatefulWidget {
  @override
  AddFavoriteBooksState createState() => AddFavoriteBooksState();
}

class AddFavoriteBooksState extends State<AddFavoriteBooks> {
  bool favirote = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 30,
        height: 30,
        child: IconButton(
            onPressed: () {
              setState(() {
                favirote = !favirote;
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
