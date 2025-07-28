import 'package:advance_flutter/lab_13/que_1/model/async_message_model.dart';
import 'package:get/get.dart';

class AsyncController extends GetxController {
  var result = Rxn<AsyncMessageModel>();
  var isLoading = false.obs;

  Future<void> fetchData() async {
    try {
      isLoading.value = true;

      await Future.delayed(Duration(seconds: 2));

      bool success = DateTime.now().second % 44 == 0;

      if (success) {
        result.value = AsyncMessageModel(" Data loaded successfully!");
      } else {
        throw Exception(" What a Failure !! ");
      }
    } catch (e) {
      result.value = AsyncMessageModel(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
