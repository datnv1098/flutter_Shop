import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:shop_app/models/User.dart';

const users = const {
  'admin@gmail.com': 'admin',
};

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormLogin();
    // Scaffold(
    //   body: new Container(
    //     child: ListView(shrinkWrap: true, children: [
    //       Column(
    //         children: [
    //           // SignInButton(
    //           //   Buttons.Google,
    //           //   text: "Login with google",
    //           //   onPressed: () => {Get.toNamed('/auth/google')},
    //           // ),
    //         ],
    //       ),
    //     ]),
    //   ),
    // );
  }
}

class FormLogin extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('data: $data');
    return Future.delayed(loginTime).then((_) async {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: data.name,
            password: data.password
        );
        print('userCredential: $userCredential');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
      return null;
    });
  }

  Future<String> createUser(LoginData data) {
    print('data: $data');
    return Future.delayed(loginTime).then((_) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: "barry.allen@example.com",
            password: "SuperSecretPassword!"
        );

        print('userCredential: $userCredential');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Classfunc',
      logo: 'assets/images/classfunc.jpg',
      onLogin: _authUser,
      onSignup: createUser,
      onSubmitAnimationCompleted: () {
        Get.toNamed('/home');
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
