import 'package:book_store_app/models/books.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  final Books books;

  const BookDetails({
    Key? key,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10));
  }
}
