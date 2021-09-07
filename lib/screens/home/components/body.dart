import 'package:book_store_app/constants.dart';
import 'package:book_store_app/models/books.dart';
import 'package:book_store_app/models/book_sort_low_to_high.dart';
import 'package:book_store_app/screens/bookdetails/book_details.dart';
import 'package:book_store_app/screens/home/components/bookview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
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
            DropDown(),
          ])),
      SizedBox(
        height: kDefaultPadding,
      ),
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

class LowToHigh extends StatefulWidget {
  const LowToHigh({Key? key}) : super(key: key);

  @override
  _LowToHighState createState() => _LowToHighState();
}

class _LowToHighState extends State<LowToHigh> {
  List<String> _relevence = [
    ' Price: Low to High',
    ' Price: High to Low',
    ' Newest Arrivals',
  ];
  String? _selectedrelevence;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
        Container(
            margin:
                EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                            print(_relevence[0]);
                          });
                        },
                        items: _relevence.map((relevance) {
                          return DropdownMenuItem(
                            child: Text(
                              relevance,
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.left,
                            ),
                            value: relevance,
                          );
                        }).toList(),
                      ))
                ])),
        SizedBox(
          height: kDefaultPadding,
        ),
        if (_selectedrelevence == _relevence[0])
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
                    itemBuilder: (context, index) => ItemCardLow(
                        books: bookes[index],
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
      ],
    );
  }
}

class DropDown extends StatefulWidget {
  @override
  DropDownState createState() => DropDownState();
}

class DropDownState extends State<DropDown> {
  List<String> _relevence = [
    ' Price: Low to High',
    ' Price: High to Low',
    ' Newest Arrivals',
  ];
  String? _selectedrelevence;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              print(_relevence[0]);
            });
          },
          items: _relevence.map((relevance) {
            return DropdownMenuItem(
              child: Text(
                relevance,
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.left,
              ),
              value: relevance,
            );
          }).toList(),
        ));
  }
}
