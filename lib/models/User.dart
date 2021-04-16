import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String image, displayName, phone, email, password;
  final int age, id;

  User(
      {this.id,
      this.image,
      this.displayName,
      this.phone,
      this.email,
      this.password,
      this.age});
}

class UserManager {
  final CollectionReference userProfile =
      FirebaseFirestore.instance.collection('users');

  getIntand() {
    return userProfile;
  }
// Future<void> createUser(
//     int id, String displayName, String email, String password) async {
//   return await userProfile.add({
//     'id': id,
//     'displayName': displayName,
//     'email': email,
//     'password': password,
//   });
// }
//
// Future<void> getListUsers() async {
//   try {
//     await userProfile.get().then((querySnapshot) {
//        querySnapshot.docs.forEach((document) {
//         print(document.reference);
//       });
//     });
//   } catch (e) {
//     print(e.toString());
//   }
// }
}
