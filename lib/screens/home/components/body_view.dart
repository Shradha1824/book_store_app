import 'package:book_store_app/constance/body_screen.dart';
import 'package:book_store_app/constants.dart';
import 'package:book_store_app/models/books.dart';
import 'package:book_store_app/screens/bookdetails/book_details.dart';
import 'package:book_store_app/screens/home/components/bookview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bodyed extends StatelessWidget {
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
      Expanded(
          child: StreamBuilder<QuerySnapshot>(
        //pass 'Stream<QuerySnapshot>' to stream
        stream:
            FirebaseFirestore.instance.collection("booksdetails").snapshots(),
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
                mainAxisSpacing: kDefaultPadding / 1.5,
                crossAxisSpacing: kDefaultPadding / 2,
                childAspectRatio: (110.0 / 220.0)),
            children: snapshot.data!.docs.map((doc) {
              return Padding(
                  padding: EdgeInsets.all(0),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //              SingleBookPage(books: books[index],)));
                    },
                    child: Container(
                        margin: EdgeInsets.all(10),
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
                              Image.network(
                                doc['image'],
                                fit: BoxFit.fill,
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
                              RaisedButton(
                                  padding: EdgeInsets.all(10),
                                  color: Colors.orangeAccent,
                                  child: Text(
                                    "ADD TO CARD",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  onPressed: () async {}),
                            ])),
                  ));
            }).toList(),
          );
        },
      ))
    ]);
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
