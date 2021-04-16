import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login/login_other/auth_bloc.dart';
import 'package:shop_app/screens/login/login_other/login_google.dart';
import 'package:shop_app/screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => AuthBloc(),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter app',
          theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/home',
          getPages: [
            GetPage(name: '/home', page: () => HomeScreen()),
            GetPage(name: '/login', page: () => LoginScreen()),
            GetPage(name: '/auth/google', page: () => GoogleSigIn()),
          ],
          // home: HomeScreen(),
        ));
  }
}
