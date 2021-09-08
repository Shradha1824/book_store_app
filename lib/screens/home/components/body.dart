import 'package:book_store_app/constants.dart';
import 'package:book_store_app/models/books.dart';
import 'package:book_store_app/models/book_sort_low_to_high.dart';
import 'package:book_store_app/screens/bookdetails/book_details.dart';
import 'package:book_store_app/screens/home/components/bookview.dart';
import 'package:book_store_app/screens/home/components/high_to_low_relevance.dart';
import 'package:book_store_app/screens/home/components/low_to_high_relevance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  List<String> _relevence = [
    ' Price: Low to High',
    ' Price: High to Low',
    ' Newest Arrivals',
  ];
  String? _selectedrelevence;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
      Container(
          margin:
              EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Books",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            Container(
                width: 140,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButton(
                  underline: SizedBox(),
                  iconSize: 25,
                  hint: Text(
                    ' Sort by relevance   ',
                    style: TextStyle(fontSize: 12),
                  ),
                  value: _selectedrelevence,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedrelevence = newValue;
                      print(_selectedrelevence);
                    });
                  },
                  items: _relevence.map((_selectedrelevence) {
                    return DropdownMenuItem(
                      child: Text(
                        _selectedrelevence,
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.left,
                      ),
                      value: _selectedrelevence,
                    );
                  }).toList(),
                ))
          ])),
      SizedBox(
        height: kDefaultPadding,
      ),
      if (_selectedrelevence == _relevence[1]) HighToLowRel(),
      if (_selectedrelevence == _relevence[0]) LowToHigh(),
      if (_selectedrelevence == _relevence[2])
        Expanded(
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
                  itemBuilder: (context, index) => ItemCard(
                      books: books[index],
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SingleBookPage(
                                    books: books[index],
                                  )),
                        );
                      }))),
        ),
      if (_selectedrelevence != _relevence[0] &&
          _selectedrelevence != _relevence[1] &&
          _selectedrelevence != _relevence[2])
        Expanded(
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
                  itemBuilder: (context, index) => ItemCard(
                      books: books[index],
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SingleBookPage(
                                    books: books[index],
                                  )),
                        );
                      }))),
        ),
    ]);
  }
}
