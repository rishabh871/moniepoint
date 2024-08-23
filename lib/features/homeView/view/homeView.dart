import 'dart:math';

import 'package:flutter/material.dart';
import 'package:real_estate_task/core/appColor/appColor.dart';
import 'package:real_estate_task/core/backgroundView/backgroundView.dart';
import 'package:real_estate_task/core/flutter_animate/flutter_animate.dart';
import 'package:real_estate_task/core/sizer/responsive_sizer.dart';
import 'package:real_estate_task/features/homeView/components/homeHeaderView.dart';
import 'package:real_estate_task/features/homeView/components/homeListView.dart';
import 'package:real_estate_task/features/homeView/components/homeOfferView.dart';
import 'package:real_estate_task/features/homeView/components/homeWelcomTextView.dart';
import 'package:real_estate_task/features/homeView/model/roomModel.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<RoomModel> data = [];
  var buyDigit = "0";
  var rentDigit = "0";

  @override
  void initState() {
    super.initState();
    initialize();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        buyDigit = "1034";
        rentDigit = "2212";
      });
    });
  }

  initialize() {
    data = [
      RoomModel(
          gridStyle: RoomGridTile(4, 2), imagePath: "assets/images/temp1.jpg"),
      RoomModel(
          gridStyle: RoomGridTile(2, 4), imagePath: "assets/images/temp2.jpg"),
      RoomModel(
          gridStyle: RoomGridTile(2, 2), imagePath: "assets/images/temp3.jpg"),
      RoomModel(
          gridStyle: RoomGridTile(2, 2), imagePath: "assets/images/temp4.jpg")
    ];
  }

  Widget build(BuildContext context) {
    print("HHHH${100.h}");
    return Scaffold(
      body: BackgroundView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  SafeArea(
                    top: true,
                    bottom: false,
                    child: HomeHeaderView(),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  HomeWelcomeTextView(),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeOfferView(
                          title: "Buy",
                          value: buyDigit,
                          isCircle: true,
                          titleStyle:
                          TextStyle(fontSize: 18.sp, color: Colors.white),
                          valueStyle: TextStyle(
                              fontSize: 24.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          backgroundColor: AppColor.theme),
                      HomeOfferView(
                          title: "Rent",
                          value: rentDigit,
                          isCircle: false,
                          titleStyle: TextStyle(
                              fontSize: 18.sp, color: AppColor.greyText),
                          valueStyle: TextStyle(
                              fontSize: 24.sp,
                              color: AppColor.greyText,
                              fontWeight: FontWeight.bold),
                          offerStyle: TextStyle(
                              fontSize: 16.sp, color: AppColor.greyText),
                          backgroundColor: Colors.white)
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.5,
              maxChildSize: 667.0 < 100.h ? 0.86 : 0.89,
              minChildSize: 0.5,
              builder: (BuildContext context, scrollController) {
                return CustomScrollView(
                  physics: ClampingScrollPhysics(),
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 4.h,
                      ),
                    ),
                    SliverFillRemaining(
                        child: HomeListView(dataModel: data)
                            .animate(delay: 1.seconds)
                            .slideY(
                            duration: 1.4.seconds,
                            curve: Curves.fastEaseInToSlowEaseOut,
                            begin: 1,
                            end: 0)),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
