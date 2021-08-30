import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _fireStore.collection('users');
final CollectionReference _cardCollection = _fireStore.collection('cards');
final CollectionReference _favBooksCollection =
    _fireStore.collection('wishlist');

class DataBase {
  static String? uid;

  static Future<void> addItem({
    required String firstName,
    required String emailId,
    required String password,
    required String phoneNo,
  }) async {
    DocumentReference documentReference = _mainCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "firstName": firstName,
      "emailId": emailId,
      "password": password,
      "phoneNo": phoneNo
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("User Succesfully Registered"))
        .catchError((e) => print(e));
  }

  static Future<void> addBooksToCard({
    required String image,
    required String title,
    required String author,
    required int price,
  }) async {
    DocumentReference documentReference = _cardCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "image": image,
      "title": title,
      "author": author,
      "price": price
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("Book added in Card"))
        .catchError((e) => print(e));
  }

  static Future<void> addBooksToWishlist({
    required String image,
    required String title,
    required String author,
    required int price,
  }) async {
    DocumentReference documentReference = _favBooksCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "image": image,
      "title": title,
      "author": author,
      "price": price
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("Book added in wishlist"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer = _favBooksCollection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}
