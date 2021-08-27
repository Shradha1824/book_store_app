import 'package:book_store_app/constants.dart';
import 'package:book_store_app/models/books.dart';
import 'package:book_store_app/screens/home/components/item_card.dart';
import 'package:book_store_app/screens/single_book_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.all(10)),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Books",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              DropDown(),
            ]),
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
  ]; // Option 2
  String? _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 140,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton(
          iconSize: 25,
          underline: SizedBox(),
          hint: Text(
            ' Sort by relevance   ',
            style: TextStyle(fontSize: 12),
          ), // Not necessary for Option 1
          value: _selectedLocation,
          onChanged: (String? newValue) {
            setState(() {
              _selectedLocation = newValue;
            });
          },
          items: _relevence.map((relevence) {
            return DropdownMenuItem(
              child: Text(
                relevence,
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.left,
              ),
              value: relevence,
            );
          }).toList(),
        ));
  }
}
