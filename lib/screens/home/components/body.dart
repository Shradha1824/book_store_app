import 'package:book_store_app/constants.dart';
import 'package:book_store_app/models/books.dart';
import 'package:book_store_app/screens/bookdetails/book_details.dart';
import 'package:book_store_app/screens/home/components/bookview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Body extends StatelessWidget {
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
        )
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
            });
          },
          items: _relevence.map((books) {
            return DropdownMenuItem(
              child: Text(
                books,
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.left,
              ),
              value: books,
            );
          }).toList(),
        ));
  }
}

class BookScreen extends StatefulWidget {
  static bool title = false;
  BookScreenState createState() => BookScreenState();
}

class BookScreenState extends State<BookScreen> {
  List<Books> booksArranged = [];

  filterByPrice(books) {
    setState(() {
      BookScreen.title = true;
    });
  }

  SortPrice(books) {
    books.sort((a, b) => a.compareTo(b));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: books.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(books[index].title),
                  leading: Text(books[index].image),
                  subtitle: Column(
                    children: [
                      !BookScreen.title
                          ? Text("\Rs.${books[index].price}")
                          : SortPrice(books[index].price),
                    ],
                  ));
            }));
  }
}
