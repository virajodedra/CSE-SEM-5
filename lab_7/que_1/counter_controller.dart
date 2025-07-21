import 'package:advance_flutter/lab_2/card_view/import_export.dart';

import 'counter_model.dart';

class CounterController extends GetxController{
  CounterModel c1 = new CounterModel();

  void increment(){
    c1.increment();
  }

  void decrement(){
    c1.decrement();
  }

  void zero(){
    c1.zero();
  }

  RxInt get count => c1.count;
}