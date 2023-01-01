import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Used to display loading and messages in screen
void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.hourGlass
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = Colors.white
    ..textColor = Colors.black
    ..errorWidget = const Icon(
      Icons.error,
      color: Colors.red,
      size: 30,
    )
    ..successWidget = const Icon(
      Icons.check_box_outline_blank_rounded,
      color: Colors.green,
      size: 30,
    )
    ..indicatorColor = const Color(0xff162a35)
    ..userInteractions = false
    ..dismissOnTap = false;
}
