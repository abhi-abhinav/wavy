import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wavy/consts/consts.dart';
import 'package:wavy/consts/lists.dart';
import 'package:wavy/views/auth_screen/signup_screen.dart';
import 'package:wavy/widgets_common/applogo_widget.dart';
import 'package:wavy/widgets_common/bg_widget.dart';
import 'package:wavy/widgets_common/custom_textfield.dart';
import 'package:wavy/widgets_common/our_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget(),
          10.heightBox,
          "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
          20.heightBox,
          Column(
            children: [
              customTextField(hint: emailhint, title: email),
              customTextField(hint: passwordhint, title: password),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: forgetPassword.text.make())),
              5.heightBox,
              ourButton(
                      color: redColor,
                      title: login,
                      textColor: whiteColor,
                      onPress: () {})
                  .box
                  .width(context.screenWidth - 50)
                  .make(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: 5.heightBox,
              ),
              createAccount.text.color(fontGrey).make(),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: 5.heightBox,
              ),
              ourButton(
                  color: lightGolden,
                  title: signup,
                  textColor: redColor,
                  onPress: () {
                    Get.to(() => const SignUpScreen().animate()
                      ..fade(delay: 1.ms, duration: 5.ms));
                  }).box.width(context.screenWidth - 50).make(),
              10.heightBox,
              loginWith.text.color(fontGrey).make(),
              5.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: lightGrey,
                            radius: 25,
                            child: Image.asset(
                              socialIconList[index],
                              width: 30,
                            ),
                          ),
                        )),
              ),
            ],
          )
              .box
              .white
              .rounded
              .padding(const EdgeInsets.all(16))
              .width(context.screenWidth - 70)
              .shadowSm
              .make(),
        ],
      )),
    ));
  }
}
