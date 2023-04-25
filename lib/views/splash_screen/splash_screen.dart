import 'package:flutter/material.dart';
import 'package:wavy/consts/consts.dart';
import 'package:wavy/views/auth_screen/login_screen.dart';
import 'package:wavy/widgets_common/applogo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
// creating a method to change screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      // using getX
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  late Image image1;
  @override
  void initState() {
    changeScreen();
    super.initState();
    image1 = Image.asset("assets/icons/bg.png");
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
          child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Image.asset("assets/icons/rmbg.png", width: 300)),
          20.heightBox,
          applogoWidget(),
          10.heightBox,
          appname.text.fontFamily(bold).size(22).white.make(),
          5.heightBox,
          appversion.text.white.make(),
          const Spacer(),
          credits.text.white.fontFamily(semibold).make(),
          30.heightBox,
        ],
      )),
    );
  }
}
