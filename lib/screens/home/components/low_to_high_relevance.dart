import 'package:book_store_app/models/book_sort_low_to_high.dart';
import 'package:book_store_app/models/books.dart';
import 'package:book_store_app/screens/bookdetails/book_details.dart';
import 'package:book_store_app/screens/home/components/low_to_high_rel_card_view.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class LowToHigh extends StatefulWidget {
  const LowToHigh({Key? key}) : super(key: key);

  @override
  _LowToHighState createState() => _LowToHighState();
}

class _LowToHighState extends State<LowToHigh> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: GridView.builder(
                itemCount: booklowtohighrel.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? 4
                        : 2,
                    mainAxisSpacing: kDefaultPadding / 1.5,
                    crossAxisSpacing: kDefaultPadding / 1.5,
                    childAspectRatio: (110.0 / 220.0)),
                itemBuilder: (context, index) => BookLowToHighRelevance(
                    booklowtohighrel: booklowtohighrel[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingleBookPage(
                                  books: books[index],
                                )),
                      );
                    }))));
  }
}
