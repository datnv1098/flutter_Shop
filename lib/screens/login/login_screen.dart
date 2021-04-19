import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

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
    return Future.delayed(loginTime).then((_) async {
      try {
        print('data: $data');
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: data.name.trim(), password: data.password);
        print('userCredential: $userCredential');
      } on FirebaseAuthException catch (e) {
        print("Error $e");
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          return 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          return 'Wrong password provided for that user.';
        }
      }
      return null;
    });
  }

  Future<String> createUser(LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      try {
        print('data: $data');
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: data.name.trim(),
          password: data.password,
        );
        print('userCredential: $userCredential');
      } on FirebaseAuthException catch (e) {
        print("Error $e");
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          return 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          return 'The account already exists for that email.';
        }
      } catch (e) {
        return e;
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
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
