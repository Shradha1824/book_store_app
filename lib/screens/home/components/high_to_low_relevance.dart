import 'package:book_store_app/constants.dart';
import 'package:book_store_app/models/book_sort_high_to_low.dart';
import 'package:book_store_app/models/books.dart';
import 'package:book_store_app/models/book_sort_low_to_high.dart';
import 'package:book_store_app/screens/bookdetails/book_details.dart';
import 'package:book_store_app/screens/home/components/bookview.dart';
import 'package:book_store_app/screens/home/components/high_to_low_rel_card_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HighToLowRel extends StatefulWidget {
  const HighToLowRel({Key? key}) : super(key: key);

  @override
  HighToLowRelState createState() => HighToLowRelState();
}

class HighToLowRelState extends State<HighToLowRel> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: GridView.builder(
              itemCount: books.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 4
                      : 2,
                  mainAxisSpacing: kDefaultPadding / 1.5,
                  crossAxisSpacing: kDefaultPadding / 1.5,
                  childAspectRatio: (110.0 / 220.0)),
              itemBuilder: (context, index) => ItemCardHighToLow(
                  bookHighToLow: bookshightolow[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleBookPage(
                                books: books[index],
                              )),
                    );
                  }))),
    );
  }
}
