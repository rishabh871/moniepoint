import 'package:flutter/material.dart';
import 'package:real_estate_task/core/appColor/appColor.dart';
import 'package:real_estate_task/core/flutter_animate/flutter_animate.dart';
import 'package:real_estate_task/core/sizer/responsive_sizer.dart';

class HomeHeaderView extends StatelessWidget {
  Widget build(BuildContext context) {
    return headerView();
  }

  headerView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 42.w,
          height: 5.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.w), color: Colors.white),
          child: Row(
            children: [
              SizedBox(
                width: 2.w,
              ),
              Image.asset(
                width: 4.w,
                height: 4.w,
                'assets/icons/location-pin.png',
                fit: BoxFit.contain,
                color: AppColor.greyText,
              ),
              SizedBox(
                width: 1.5.w,
              ),
              Expanded(
                  child: Text(
                    "Saint Petersburg",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColor.greyText,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                width: 2.w,
              ),
            ],
          )
              .animate()
              .scale(duration: 1.seconds, curve: Curves.fastOutSlowIn)
              .fadeIn(),
        ).animate().moveX(
            duration: 1.3.seconds, curve: Curves.ease, begin: -42.w, end: 1),
        Image.asset(
          width: 10.w,
          height: 10.w,
          'assets/icons/user_avatar.png',
          fit: BoxFit.contain,
        )
            .animate()
            .scale(duration: 1.3.seconds, curve: Curves.fastOutSlowIn)
            .fadeIn(),
      ],
    );
  }
}
