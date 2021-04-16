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
    Scaffold(
      body: new Container(
        child: ListView(shrinkWrap: true, children: [
          Column(
            children: [
              // FormLogin(),
              SignInButton(
                Buttons.Google,
                text: "Login with google",
                onPressed: () => {Get.toNamed('/auth/google')},
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class FormLogin extends StatelessWidget {
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
      Map<String, dynamic> newUser = new Map<String, dynamic>();
      newUser["id"] = 0;
      newUser["displayName"] = "Dat Nguyen";
      newUser["email"] = "xdatgd@gmail.com";
      newUser["password"] = "password";

      dynamic res = UserManager().getIntand().add(newUser);
      print(data.toString());
      print('$res');
      if (res == null) {
        return 'Register Fail !';
      }
      Get.toNamed('/home');
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
