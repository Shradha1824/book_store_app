import 'package:book_store_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCounter extends StatefulWidget {
  CardCounterState createState() => CardCounterState();
}

class CardCounterState extends State<CardCounter> {
  int numOfItem = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItem > 1) {
              setState(() {
                numOfItem--;
              });
            }
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Text(numOfItem.toString().padLeft(2, "0"),
              style: TextStyle(
                fontSize: 15,
              )),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItem++;
              });
            })
      ],
    );
  }

  SizedBox buildOutlineButton({required IconData icon, press}) {
    return SizedBox(
        width: 40,
        height: 20,
        child: OutlinedButton(
            onPressed: press,
            child: Icon(
              icon,
              size: 15,
            )));
  }
}
