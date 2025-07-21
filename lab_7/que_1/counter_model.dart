import 'package:advance_flutter/lab_2/card_view/import_export.dart';

class CounterModel{
  RxInt count = 0.obs;

  void increment(){
    count.value += 1;
  }

  void decrement(){
    count.value -= 1;
  }
  void zero(){
    count.value = 0;
  }
}