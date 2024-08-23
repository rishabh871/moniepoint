import 'package:flutter/material.dart';
import 'package:real_estate_task/core/sizer/responsive_sizer.dart';
import 'package:real_estate_task/core/widgets/collection/collection.dart';
import 'package:real_estate_task/core/widgets/staggerGrid/src/widgets/staggered_grid.dart';
import 'package:real_estate_task/core/widgets/staggerGrid/src/widgets/staggered_grid_tile.dart';
import 'package:real_estate_task/features/homeView/components/animatedArrowButton.dart';
import 'package:real_estate_task/features/homeView/model/roomModel.dart';

class HomeListView extends StatelessWidget {
  HomeListView({required this.dataModel});
  List<RoomModel> dataModel = [];
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 10.sp),
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: [
          ...dataModel.mapIndexed((index, item) {
            return StaggeredGridTile.count(
              crossAxisCellCount: item.gridStyle!.crossAxisCount,
              mainAxisCellCount: item.gridStyle!.mainAxisCount,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 5.sp),
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.w),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        width: item.gridStyle!.crossAxisCount * 100,
                        height: item.gridStyle!.mainAxisCount * 100,
                        child: Image.asset(
                          '${item.imagePath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 5.w,
                      right: 5.w,
                      bottom: 1.5.h,
                      child: AnimatedArrowButton())
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
