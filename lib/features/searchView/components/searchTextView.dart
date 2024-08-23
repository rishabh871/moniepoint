import 'package:flutter/material.dart';
import 'package:real_estate_task/core/flutter_animate/flutter_animate.dart';
import 'package:real_estate_task/core/sizer/responsive_sizer.dart';

class SearchHeaderView extends StatelessWidget {
  Widget build(BuildContext context) {
    return headerView();
  }

  headerView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: 78.w,
            height: 5.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.w),
                color: Colors.white),
            child: Row(
              children: [
                SizedBox(
                  width: 4.w,
                ),
                Image.asset(
                  width: 4.w,
                  height: 4.w,
                  'assets/icons/search_black.png',
                  fit: BoxFit.contain,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                    child: Text(
                      "Saint Petersburg",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(
                  width: 2.w,
                ),
              ],
            ))
            .animate()
            .scale(duration: 1.3.seconds, curve: Curves.fastOutSlowIn)
            .fadeIn(),
        Image.asset(
          width: 10.w,
          height: 10.w,
          'assets/icons/filter.png',
          fit: BoxFit.contain,
        )
            .animate()
            .scale(duration: 1.seconds, curve: Curves.fastOutSlowIn)
            .fadeIn(),
      ],
    );
  }
}
