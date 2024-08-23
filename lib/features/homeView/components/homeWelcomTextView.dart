import 'package:flutter/material.dart';
import 'package:real_estate_task/core/appColor/appColor.dart';
import 'package:real_estate_task/core/flutter_animate/flutter_animate.dart';
import 'package:real_estate_task/core/sizer/responsive_sizer.dart';

class HomeWelcomeTextView extends StatelessWidget {
  Widget build(BuildContext context) {
    return welcomeTextView();
  }

  welcomeTextView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Hi Marina",
          style: TextStyle(fontSize: 20.sp, color: AppColor.greyText),
        )
            .animate(delay: 0.5.seconds)
            .slideY(duration: 3.seconds, curve: Curves.easeOutCubic)
            .fadeIn(),
        SizedBox(
          height: 1.h,
        )
            .animate()
            .slideY(duration: 3.seconds, curve: Curves.easeOutCubic)
            .fadeIn(),
        Text(
          "let's select your ",
          style: TextStyle(fontSize: 23.sp, color: Colors.black),
        )
            .animate(delay: 0.6.seconds)
            .scaleY(
          duration: 1.seconds,
          curve: Curves.ease,
        )
            .slideY(duration: 1.seconds, curve: Curves.ease, begin: 0.5, end: 0)
            .fadeIn(),
        Text(
          "perfect place",
          style: TextStyle(fontSize: 23.sp, color: Colors.black),
        )
            .animate(delay: 0.7.seconds)
            .scaleY(
          duration: 1.3.seconds,
          curve: Curves.ease,
        )
            .slideY(
            duration: 1.3.seconds, curve: Curves.ease, begin: 0.2, end: 0)
            .fadeIn()
      ],
    );
  }
}
