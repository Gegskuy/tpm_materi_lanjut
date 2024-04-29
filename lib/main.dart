import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilebgs/favorite.dart';
import 'package:mobilebgs/home_screen.dart';
import 'package:mobilebgs/login_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilebgs/recomendation.dart';
import 'home_screen.dart';
import 'stopwatch_screen.dart';

void main() async{
  await GetStorage.init();
  await GetStorage.init('fav');
  await GetStorage.init('session');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final session = GetStorage('session');
  late bool isLogin = session.read('isLogin')??false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogin? HomeScreen() : LoginScreen(),
    );
  }
}
