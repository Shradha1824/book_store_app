import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Widget _buildFeaturedProduct(
      {String? image, String? title, String? author, String? price}) {
    return Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(10),
            height: 280,
            width: 170,
            color: Colors.white,
            child: Column(children: [
              Container(
                  height: 150,
                  width: 170,
                  color: Colors.white,
                  child: Image.asset(
                    "assets/$image",
                  )),
              SizedBox(
                height: 5,
              ),
              Row(children: [
                Padding(padding: EdgeInsets.only(left: 10)),
                Text("$title")
              ]),
              SizedBox(
                height: 5,
              ),
              Row(children: [
                Padding(padding: EdgeInsets.only(left: 10)),
                Text(
                  "by $author",
                  style: TextStyle(fontSize: 10, color: Colors.black38),
                )
              ]),
              SizedBox(
                height: 5,
              ),
              Row(children: [
                Padding(padding: EdgeInsets.only(left: 10)),
                Text(
                  "Rs. $price",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )
              ]),
              Row(children: [
                Padding(padding: EdgeInsets.all(5)),
                FlatButton(
                    child: Text(
                      "ADD TO BAG",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.orange.withOpacity(0.8),
                    onPressed: () {}),
                SizedBox(
                  width: 2,
                ),
              ]),
            ])));
  }

  FocusNode _focusNode = FocusNode();
  List<String> _relevence = [
    ' Price: Low to High',
    ' Price: High to Low',
    ' Newest Arrivals',
  ]; // Option 2
  String? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/images/book1.png',
                fit: BoxFit.contain,
                height: 32,
                width: 32,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  width: 280,
                  height: 40,
                  color: Colors.white,
                  child: TextField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(2),
                        hintText: "Search...",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal()),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: _focusNode.hasFocus
                                    ? Colors.white
                                    : Colors.white))),
                  )),
              SizedBox(
                width: 13,
              ),
              Icon(Icons.shopping_cart_outlined)
            ],
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Books",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
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
                    ))
              ]),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                SizedBox(
                  width: 5,
                ),
                _buildFeaturedProduct(
                    image: ("images/book16.png"),
                    title: "Revision Paper",
                    author: "S. H. Vishwanath",
                    price: "700"),
                SizedBox(
                  width: 10,
                ),
                _buildFeaturedProduct(
                    image: ("images/book3.png"),
                    title: "Build an E-Commerce",
                    author: "Rumaysa Ahmed",
                    price: "250"),
              ]),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                SizedBox(
                  width: 5,
                ),
                _buildFeaturedProduct(
                    image: ("images/book4.png"),
                    title: "Rising heat",
                    author: "Perumal",
                    price: "400"),
                SizedBox(
                  width: 10,
                ),
                _buildFeaturedProduct(
                    image: ("images/book5.png"),
                    title: "Just like You",
                    author: "Nick Hornby",
                    price: "500"),
              ]),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                SizedBox(
                  width: 5,
                ),
                _buildFeaturedProduct(
                    image: ("images/book6.png"),
                    title: "Richest Man Babylon",
                    author: "George S Clason",
                    price: "600"),
                SizedBox(
                  width: 10,
                ),
                _buildFeaturedProduct(
                    image: ("images/book7.png"),
                    title: "CBSC Sylabus",
                    author: "Vijay K.",
                    price: "600"),
              ]),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                SizedBox(
                  width: 5,
                ),
                _buildFeaturedProduct(
                    image: ("images/book8.png"),
                    title: "Get Smart",
                    author: "Handry",
                    price: "500"),
                SizedBox(
                  width: 10,
                ),
                _buildFeaturedProduct(
                    image: ("images/book9.png"),
                    title: "Think like a Rocket",
                    author: "Panik H.",
                    price: "800"),
              ]),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                SizedBox(
                  width: 5,
                ),
                _buildFeaturedProduct(
                    image: ("images/book10.png"),
                    title: "How to Speak",
                    author: "Ron Malhotra",
                    price: "600"),
                SizedBox(
                  width: 10,
                ),
                _buildFeaturedProduct(
                    image: ("images/book11.png"),
                    title: "Winning like Sourav",
                    author: "Abhirup Bhatachary",
                    price: "750"),
              ]),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                SizedBox(
                  width: 5,
                ),
                _buildFeaturedProduct(
                    image: ("images/book12.png"),
                    title: "Oxfort Avanced",
                    author: "Ajit j.",
                    price: "800"),
                SizedBox(
                  width: 10,
                ),
                _buildFeaturedProduct(
                    image: ("images/book13.png"),
                    title: "Tip Of the Iceberg",
                    author: "Suveen Sinha",
                    price: "670"),
              ]),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                SizedBox(
                  width: 5,
                ),
                _buildFeaturedProduct(
                    image: ("images/book14.png"),
                    title: "How to Read a Book",
                    author: "Nortimer J. Adler",
                    price: "900"),
                SizedBox(
                  width: 10,
                ),
                _buildFeaturedProduct(
                    image: ("images/book15.png"),
                    title: "Winning Sachin",
                    author: "Devendra Prabhudesi",
                    price: "850"),
              ]),
              //   SizedBox(
              //     height: 20,
              //   ),
              //   Row(children: [
              //     SizedBox(
              //       width: 5,
              //     ),
              //     _buildFeaturedProduct(image: ("images/book16.png")),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     _buildFeaturedProduct(image: ("images/book18.png")),
              //   ]),
              //   SizedBox(
              //     height: 20,
              //   ),
              //   Row(children: [
              //     SizedBox(
              //       width: 5,
              //     ),
              //     _buildFeaturedProduct(image: ("images/book19.png")),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     _buildFeaturedProduct(image: ("images/book20.png")),
              //   ]),
              //   SizedBox(
              //     height: 20,
              //   ),
              //   Row(children: [
              //     SizedBox(
              //       width: 5,
              //     ),
              //     _buildFeaturedProduct(image: ("images/book21.png")),
              //     SizedBox(
              //       width: 10,
              //     ),
              //   ]),
            ])));
  }
}
