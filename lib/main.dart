import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wavy/consts/consts.dart';
import 'package:wavy/views/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // using getX so
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hack To Future',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
            // to set appBar icons color
            iconTheme: IconThemeData(color: golden),
            backgroundColor: Colors.transparent),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
