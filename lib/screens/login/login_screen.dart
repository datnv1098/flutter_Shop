import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

const users = const {
  'admin@gmail.com': 'admin',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _loginOther(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      Get.toNamed('/auth/google');
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
      onSignup: _loginOther,
      onSubmitAnimationCompleted: () {
        Get.toNamed('/home');
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}