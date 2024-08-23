import 'package:flutter/material.dart';
import 'package:real_estate_task/core/appColor/appColor.dart';
import 'package:real_estate_task/core/sizer/responsive_sizer.dart';

class CustomHeaderBar extends StatelessWidget {
  CustomHeaderBar(
      {required this.asset,
      required this.onItemTapped,
      this.selectedIndex = 0,
      this.assignIndex = 0,
      this.title = ""});
  String? asset;
  int? selectedIndex;
  int? assignIndex;
  String title = "";
  Function(int) onItemTapped;
  Widget build(BuildContext context) {
    return view();
  }

  Widget view() {
    return Container(
      margin: EdgeInsets.all(1.w),
      child: GestureDetector(
        onTap: () => onItemTapped(assignIndex ?? 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 13.w,
              height: 13.w,
              decoration: assignIndex == selectedIndex
                  ? const BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.orangeIndicator)
                  : null,
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: Image.asset(
                  'assets/icons/${asset}',
                  fit: BoxFit.contain,
                  color: assignIndex == selectedIndex
                      ? Colors.white
                      : Colors.white,
                ),
              ),
            ),
            if (title != "")
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: assignIndex == selectedIndex
                      ? Colors.white
                      : Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
