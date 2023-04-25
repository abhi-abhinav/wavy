import 'package:flutter/widgets.dart';
import 'package:wavy/consts/consts.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/icons/bg1.png"), fit: BoxFit.fill)),
    child: child,
  );
}
