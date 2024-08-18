import 'package:hive_flutter/hive_flutter.dart';

class DataBase {
  final _mybox = Hive.box("MyData");

  List item = [];

  //first time ever opening the app

  void initialOpen() {
    item = [
      ["Example", false]
    ];
  }

  //load data
  void loadData() {
    item = _mybox.get("item");
  }

  //update
  void updateData() {
    _mybox.put("item", item);
  }
}
