import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _fireStore.collection('users');

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
        .whenComplete(() => print("Note added in firebase"))
        .catchError((e) => print(e));
  }
}
