import 'package:get/get.dart';
import '../model/custom_exception_model.dart';

class CustomExceptionController extends GetxController {
  var result = ''.obs;

  void checkAge(int age) {
    try {
      if (age < 18) {
        throw InvalidAgeException("Age must be at least 18.");
      }
      result.value = " Age is valid and You are ${age} Years old !!!!!";
    } catch (exception) {
      result.value = exception.toString();
    }
  }
}
