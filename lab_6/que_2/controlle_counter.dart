import 'package:get/get.dart';

class CounterController extends GetxController {
  // Rx variable using .obs
  var count = 0.obs;

  void increment() {
    count++; // No need to call update()
  }
}
