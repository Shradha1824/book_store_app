import 'package:book_store_app/models/books.dart';
import 'package:book_store_app/screens/bookdetails/add_to_card.dart';
import 'package:book_store_app/screens/home/components/body.dart';
import 'package:book_store_app/utils/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  FocusNode _focusNode = FocusNode();
  int numOfItem = 0;
  int numberOfWish = 0;
  SharedPreferences? _preferences;

  var searchString;
  bool _searchView = false;
  bool _addcard = false;
  bool _addWish = false;
  bool favirote = false;

  void initState() {
    super.initState();
    _saveCounter();
  }

  void _saveCounter() async {
    SharedPreferences _preferance = await SharedPreferences.getInstance();

    setState(() {
      numOfItem = _preferance.getInt('numOfItem')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: [
            Expanded(
                child: Container(
                    color: Colors.white,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchString = value.toUpperCase();
                          // gridView = !gridView;
                        });
                      },
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(2),
                          hintText: "Search...",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: _focusNode.hasFocus
                                      ? Colors.grey.shade600
                                      : Colors.grey.shade500))),
                    ))),
            SizedBox(
              width: 10,
            ),
            Stack(children: <Widget>[
              Positioned(
                height: 250,
                width: 250,
                child: Container(
                  width: 150,
                  height: 150,
                  child: Text(numOfItem.toString().padLeft(2, "0"),
                      style: TextStyle(fontSize: 15, color: Colors.red)),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddToCard()));
                  },
                  icon: Icon(Icons.shopping_cart_outlined))
            ]),
            Stack(children: <Widget>[
              Positioned(
                height: 250,
                width: 250,
                child: Container(
                  width: 100,
                  height: 100,
                  child: Text(numberOfWish.toString().padLeft(2, "0"),
                      style: TextStyle(fontSize: 15, color: Colors.red)),
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _searchView = !_searchView;
                    });
                  },
                  icon: Icon(Icons.favorite_outline))
            ])
          ]),
          backgroundColor: Colors.orangeAccent,
        ),
        body: changeView());
  }

  Widget searchBooks() {
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
      // if (searchString == true)
      Expanded(
          child: StreamBuilder<QuerySnapshot>(
        //pass 'Stream<QuerySnapshot>' to stream
        stream: FirebaseFirestore.instance
            .collection("booksdetails")
            .where("title", isGreaterThanOrEqualTo: searchString)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 4
                        : 2,
                // mainAxisSpacing: kDefaultPadding / 6,
                // crossAxisSpacing: kDefaultPadding / 6,
                childAspectRatio: (110.0 / 220.0)),
            children: snapshot.data!.docs.map((doc) {
              return Padding(
                  padding: EdgeInsets.all(0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(kDefaultPadding),
                      padding: EdgeInsets.only(
                        left: kDefaultPadding / 2,
                        right: kDefaultPadding / 2,
                        top: kDefaultPadding / 2,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade400)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              doc['image'],
                              height: 170,
                              width: 170,
                              fit: BoxFit.fill,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                    child: CircularProgressIndicator());
                              },
                            ),
                            SizedBox(
                              height: kDefaultPadding / 2,
                            ),
                            Text(
                              doc['title'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                            SizedBox(
                              height: kDefaultPadding / 2,
                            ),
                            Text(
                              doc['author'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                            SizedBox(
                              height: kDefaultPadding / 2,
                            ),
                            Text(
                              doc['price'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _addcard ? _addedtocard() : _addtocard(),
                            if (_addWish == true)
                              _addWish ? wishlist() : _addtocard()
                          ]),
                    ),
                  ));
            }).toList(),
          );
        },
      ))
    ]);
  }

  changeView() {
    if (_searchView == true) {
      return searchBooks();
    } else {
      return Body();
    }
  }

  Widget _addtocard() {
    return Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 100,
              height: 30,
              child: RaisedButton(
                  color: Colors.orangeAccent,
                  child: Text(
                    "ADD TO CARD",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  onPressed: () async {
                    SharedPreferences _preferance =
                        await SharedPreferences.getInstance();
                    // _preferance
                    //     .remove('numOfItem');
                    _preferance.setInt('numOfItem', numOfItem);
                    // setState(() {
                    //   _addcard = !_addcard;
                    // });

                    setState(() {
                      numOfItem++;
                    });
                  })),
          wishlist()
        ]);
  }

  Widget wishlist() {
    return SizedBox(
        width: 20,
        height: 20,
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

  Widget _addedtocard() {
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
                  setState(() {
                    _addcard = !_addcard;
                  });
                })),
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
            books.sort();
            setState(() {
              _selectedrelevence = newValue;
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
