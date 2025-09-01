import 'package:get/get.dart';
import '../model/screen_model.dart';

class ScreenController extends GetxController {
  late ScreenModel model;

  void updateScreenSize(double width) {
    model = ScreenModel(width);
    update(); // notify UI
  }
}
