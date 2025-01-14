import 'package:flutter/material.dart';

class DeviceUtil {
  static String get _getDeviceType {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550 ? 'phone' : 'tablet';
  }

  static double get getSize {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide;
  }

  static bool get isTablet {
    return _getDeviceType == 'tablet';
  }
}
