import 'package:get/get.dart';

class VariableCounterController extends GetxController {
  int counter = 0;

  void increase() {
    counter++;
    update();
  }

  void reset() {
    counter = 0;
    update();
  }
}
