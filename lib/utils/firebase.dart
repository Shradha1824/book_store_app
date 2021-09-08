import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _fireStore.collection('users');
final CollectionReference _cardCollection = _fireStore.collection('cards');
final CollectionReference _customerCollection =
    _fireStore.collection('customerdetails');

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

  static Future<void> addCustomerDetails({
    required String name,
    required String phoneno,
    required String pincode,
    required String locality,
    required String address,
    required String city,
    required String landmark,
    required String userEmail,
  }) async {
    DocumentReference documentReference = _customerCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "phoneno": phoneno,
      "pincode": pincode,
      "locality": locality,
      "address": address,
      "city": city,
      "landmark": landmark,
      "userEmail": userEmail
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("User Succesfully Registered"))
        .catchError((e) => print(e));
  }

  static Future<void> addBooksToCard(
      {required String image,
      required String title,
      required String author,
      required String price,
      required bool wishlist}) async {
    DocumentReference documentReference = _cardCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "image": image,
      "title": title,
      "author": author,
      "price": price,
      "wishlist": wishlist
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("Book added in Card"))
        .catchError((e) => print(e));
  }
}
