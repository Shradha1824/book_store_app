import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../constance/book.dart';

class BooksApi {
  static Future<List<Book>> getUsersLocally(BuildContext context) async {
    final assetsBundle = DefaultAssetBundle.of(context);
    final data = await assetsBundle.loadString('assets/books.json');
    final body = json.decode(data);
    return body.map<Book>(Book.fromJson).toList();
  }
}
