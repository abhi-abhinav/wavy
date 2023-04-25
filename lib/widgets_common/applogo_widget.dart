import 'package:flutter/material.dart';
import 'package:wavy/consts/consts.dart';

Widget applogoWidget() {
  // using Velocity x here
  return SingleChildScrollView(
    child: Center(
      child: Image.asset("assets/icons/logo1.gif")
          .box
          .white
          .size(200, 200)
          .padding(const EdgeInsets.all(35))
          .roundedFull
          .border(color: Vx.purple200)
          .shadowMd
          .make(),
    ),
  );
}
