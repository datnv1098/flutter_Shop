import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controllers/Auth.dart';
import 'package:shop_app/controllers/User.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login/login_screen.dart';

class CheckLogin extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          print("User Ok !");
          return HomeScreen();
        } else {
          print("User Ok !");
          return LoginScreen();
        }
      },
    );
  }
}