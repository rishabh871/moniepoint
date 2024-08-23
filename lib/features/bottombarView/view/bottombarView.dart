import 'package:flutter/material.dart';
import 'package:real_estate_task/core/appColor/appColor.dart';
import 'package:real_estate_task/core/flutter_animate/flutter_animate.dart';
import 'package:real_estate_task/core/sizer/responsive_sizer.dart';
import 'package:real_estate_task/features/bottombarView/components/customBottomBar.dart';
import 'package:real_estate_task/features/homeView/view/homeView.dart';
import 'package:real_estate_task/features/searchView/view/searchView.dart';

class BottomBarView extends StatefulWidget {
  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  var selectedIndex = 2;
  double imageHeight = 450;
  final List<Widget> _screen = [
    SearchView(),
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView()
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          _screen[selectedIndex],
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(child: bottomView())
                .animate(delay: 2.seconds)
                .slideY(
                duration: 1.4.seconds,
                curve: Curves.fastEaseInToSlowEaseOut,
                begin: 1,
                end: 0),
          )
        ],
      ),
    );
  }

  bottomView() {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 10.w),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.customBlackText,
          borderRadius: BorderRadius.circular(50.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBottomBar(
                asset: "search.png",
                selectedIndex: selectedIndex,
                assignIndex: 0,
                onItemTapped: (index) {
                  onTapBottomBarAction(index);
                },
              ),
              CustomBottomBar(
                  asset: "comment.png",
                  assignIndex: 1,
                  selectedIndex: selectedIndex,
                  onItemTapped: (index) {
                    onTapBottomBarAction(index);
                  }),
              CustomBottomBar(
                  asset: "house-window.png",
                  assignIndex: 2,
                  selectedIndex: selectedIndex,
                  onItemTapped: (index) {
                    onTapBottomBarAction(index);
                  }),
              CustomBottomBar(
                //  title: 'Account',
                  asset: "heart.png",
                  assignIndex: 3,
                  selectedIndex: selectedIndex,
                  onItemTapped: (index) {
                    onTapBottomBarAction(index);
                  }),
              CustomBottomBar(
                // title: 'Notifications',
                  asset: "user.png",
                  assignIndex: 4,
                  selectedIndex: selectedIndex,
                  onItemTapped: (index) {
                    onTapBottomBarAction(index);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  onTapBottomBarAction(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
