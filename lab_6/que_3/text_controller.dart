import 'package:get/get.dart';

class TextController extends GetxController {
  // RxString to store and observe text
  var inputText = ''.obs;

  // Function to update the text
  void updateText(String value) {
    inputText.value = value;
  }
}
