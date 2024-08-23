import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:real_estate_task/core/flutter_animate/flutter_animate.dart';
import 'package:real_estate_task/core/sizer/responsive_sizer.dart';
import 'package:real_estate_task/core/widgets/blur/blur.dart';

class ListMapButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return view();
  }

  view() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: 37.w,
            height: 12.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.w),
            ),
            child: Blur(
                blur: 2, blurColor: Colors.grey.shade300, child: Container())),
        Row(
          children: [
            Image.asset(
              width: 4.w,
              height: 4.w,
              'assets/icons/align-left.png',
              fit: BoxFit.contain,
              color: Colors.white,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              "List of variants",
              style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            )
          ],
        )
      ],
    );
  }
}
