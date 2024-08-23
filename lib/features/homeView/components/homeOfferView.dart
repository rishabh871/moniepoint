import 'package:flutter/material.dart';
import 'package:real_estate_task/core/appColor/appColor.dart';
import 'package:real_estate_task/core/flutter_animate/flutter_animate.dart';
import 'package:real_estate_task/core/sizer/responsive_sizer.dart';
import 'package:real_estate_task/core/widgets/animated_text/src/animated_number_text.dart';

class HomeOfferView extends StatelessWidget {
  HomeOfferView({required this.value,
    this.title = "",
    this.isCircle = false,
    this.backgroundColor,
    this.titleStyle,
    this.valueStyle,
    this.offerStyle});

  String value = "";
  String title = "";
  bool isCircle = false;
  Color? backgroundColor;
  TextStyle? titleStyle;
  TextStyle? valueStyle;
  TextStyle? offerStyle;

  Widget build(BuildContext context) {
    return offerView();
  }

  offerView() {
    return Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isCircle ? 50.w : 5.w),
            color: backgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${title}",
              style: titleStyle ??
                  TextStyle(fontSize: 20.sp, color: AppColor.greyText),
            ),
            SizedBox(
              height: 7.w,
            ),
            AnimatedNumberText(
              int.tryParse(value) ?? 0,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 2000),
              style: valueStyle ??
                  TextStyle(fontSize: 20.sp, color: AppColor.greyText),
            ),
            Text(
              "Offers",
              style: offerStyle ??
                  TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
            SizedBox(
              height: 5.w,
            ),
          ],
        )).animate(delay: 0.9.seconds).scale(
      duration: 1.7.seconds,
      curve: Curves.fastOutSlowIn,
      begin: Offset(0, 0),
      end: Offset(1, 1),
    );
  }
}
