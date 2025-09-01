import 'package:advance_flutter/lab_18/que_3/model/font_model.dart';
import 'package:advance_flutter/lab_2/card_view/import_export.dart';

class FontController extends GetxController{
  late FontModel model;

  void updateScreenWidth(double width) {
    model = FontModel(width);
    update();
  }

}