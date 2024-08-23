import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_task/core/appColor/appColor.dart';
import 'package:real_estate_task/core/flutter_animate/flutter_animate.dart';
import 'package:real_estate_task/core/sizer/responsive_sizer.dart';
import 'package:real_estate_task/features/searchView/components/listMapButton.dart';
import 'package:real_estate_task/features/searchView/components/mapNavigationButtons.dart';
import 'package:real_estate_task/features/searchView/components/searchTextView.dart';

class SearchView extends StatefulWidget {
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with TickerProviderStateMixin {
  var isShowOverlayPopMenu = false;
  AnimationController? animatedController;
  var isInitializeMenu = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initialize();
    animatedController = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }


  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              width: 100.w,
              height: 100.w,
              'assets/images/map.jpg',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    top: true,
                    bottom: false,
                    child: SearchHeaderView(),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 15.h,
                left: 8.w,
                child: MapNavigationButton(
                  onTap: () {
                    openCloseMenu();
                  },
                )),
            Positioned(bottom: 15.h, right: 8.w, child: ListMapButton()),
            addMakersOnMap(),
            if (isShowOverlayPopMenu)
              Positioned(
                  bottom: 0,
                  left: 0,
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      animatedController?.reverse();
                      Future.delayed(Duration(milliseconds: 1000), () {
                        isShowOverlayPopMenu = false;
                        isInitializeMenu = false;
                        setState(() {});
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                    ),
                  )),
            if (isInitializeMenu)
              Positioned(bottom: 21.5.h, left: 8.w, child: menuListView()),
          ],
        ));
  }

  addMakersOnMap() {
    return Stack(fit: StackFit.expand, children: [
      Positioned(top: 20.h, left: 20.w, child: myMapMarker()),
      Positioned(top: 26.h, left: 26.w, child: myMapMarker()),
      Positioned(top: 40.h, left: 50.w, child: myMapMarker()),
      Positioned(top: 50.h, left: 10.w, child: myMapMarker()),
    ]);
  }

  myMapMarker() {
    return Container(
      width: 20.w,
      height: 4.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColor.theme,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(2.w),
          topRight: Radius.circular(2.w),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(2.w),
        ),
      ),
      child: Center(
        child: Text(
          "109,KM",
          style: TextStyle(
              fontSize: 15.sp,
              color: Colors.white,
              fontWeight: FontWeight.w400),
        ),
      ),
    )
        .animate(onComplete: (controller) {})
        .moveX(
      begin: 0,
      end: 1,
    )
        .scaleXY(
        duration: 1.seconds,
        alignment: Alignment.bottomLeft,
        curve: Curves.fastOutSlowIn);
    ;
  }

  openCloseMenu() {
    isShowOverlayPopMenu = !isShowOverlayPopMenu;
    isInitializeMenu = true;
    setState(() {});
    if (isShowOverlayPopMenu) {
      animatedController?.reverse();
      // animatedController = null;
    } else {
      animatedController?.forward();
    }
  }

  menuListView() {
    return Container(
      width: 45.w,
      height: 17.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 249, 246, 240),
          borderRadius: BorderRadius.circular(5.w)
      ),
      child: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          _buildMenuItem(
            Icons.home,
            "Cosy areas",
          ),
          SizedBox(
            height: 1.h,
          ),
          _buildMenuItem(
            Icons.wallet,
            "Price",
          ),
          SizedBox(
            height: 1.h,
          ),
          _buildMenuItem(
            Icons.delete,
            "Infrastructure",
          ),
          SizedBox(
            height: 1.h,
          ),
          _buildMenuItem(
            Icons.layers,
            "Without any layer",
          )
        ],
      ),
    )
        .animate(
        controller: animatedController,
        onComplete: (controller) {
          print("onComplete");
          // animatedController = controller;
        })
        .moveX(
      begin: 0,
      end: 1,
    )
        .scaleXY(
        duration: 1.seconds,
        alignment: Alignment.bottomLeft,
        curve: Curves.fastOutSlowIn);
  }

  Widget _buildMenuItem(IconData icon, String text,
      {bool highlighted = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 3.w,
        ),
        Icon(icon, color: highlighted ? Colors.orange : Colors.grey.shade400),
        SizedBox(
          width: 3.w,
        ),
        Text(
          text,
          style: TextStyle(
              color: highlighted ? Colors.orange : Colors.grey,
              fontSize: 15.sp),
        ),
      ],
    );
  }
}
