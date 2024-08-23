// ignore: file_names
import 'package:flutter/material.dart';

class AppColor {
  static const sidebarIconColor = Color(0xff697586);
  static const theme = Color(0xfffc9d11);
  static const orangeIndicator = Color(0xfffc9d11);
  static const greyText = Color(0xffa99b85);
  static const customBlackText = Color(0xff232220);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.tryParse(hexColor, radix: 16) ?? 0;
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
