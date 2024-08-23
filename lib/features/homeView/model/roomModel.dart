import 'package:real_estate_task/features/homeView/components/homeListView.dart';

class RoomModel {
  String? imagePath = "";
  RoomGridTile? gridStyle = RoomGridTile(4, 4);
  RoomModel({this.imagePath, this.gridStyle});
}

class RoomGridTile {
  RoomGridTile(this.crossAxisCount, this.mainAxisCount);
  final int crossAxisCount;
  final int mainAxisCount;
}
