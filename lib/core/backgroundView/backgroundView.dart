import 'package:flutter/material.dart';

class BackgroundView extends StatelessWidget {
  Widget child;
  Color? color;
  bool? removeBackIcon;
  bool? needBgImage;

  Function? onBackPress;
  BackgroundView(
      {super.key,
      required this.child,
      this.color,
      this.onBackPress,
      this.needBgImage = true,
      this.removeBackIcon = false});

  @override
  Widget build(BuildContext context) {
    // GlobalVariable.globarProviderManager.animateController =
    //     AnimationController(vsync: this);
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              stops: [0.1, 0.25, 0.9],
              colors: [
                Color(0xfffaf6f4),
                Color(0xFFf8f3ed),
                Color(0xFFfad9b2),
              ],
            ),
          ),
          //color: !needBgImage! ? color ?? AppColor.theme : Colors.transparent,
          child: child,
        ),
      ],
    );
  }
}
