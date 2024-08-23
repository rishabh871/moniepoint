import 'package:flutter/material.dart';
import 'package:real_estate_task/core/flutter_animate/flutter_animate.dart';
import 'package:real_estate_task/core/sizer/responsive_sizer.dart';
import 'package:real_estate_task/core/widgets/blur/blur.dart';

class MapNavigationButton extends StatelessWidget {
  MapNavigationButton({required this.onTap});

  Function()? onTap;

  Widget build(BuildContext context) {
    return buttonView();
  }

  buttonView() {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      blurView(asset: "layer.png", onTap: onTap),
      SizedBox(
        height: 1.h,
      ),
      blurView(asset: "gps.png", onTap: onTap)
    ]);
  }

  blurView({asset = "", required onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 12.w,
        height: 12.w,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            Blur(blur: 2, blurColor: Colors.grey.shade300, child: Container()),
            Padding(
              padding: EdgeInsets.all(3.5.w),
              child: Image.asset('assets/icons/${asset}',
                  fit: BoxFit.contain, color: Colors.white),
            ),
          ],
        ),
      )
          .animate()
          .scale(duration: 1.seconds, curve: Curves.fastOutSlowIn)
          .fadeIn(),
    );
  }
}
