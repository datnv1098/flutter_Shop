import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id, email, name, password;

  UserModel({this.id, this.email, this.name, this.password});
  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    password = documentSnapshot["password"];
    email = documentSnapshot["email"];
  }
}
