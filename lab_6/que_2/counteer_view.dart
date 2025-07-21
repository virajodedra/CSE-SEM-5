import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../lab_7/que_1/counter_controller.dart';

class CounterView extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rx & Obx Example')),
      body: Center(
        child: Obx(() => Text(
          'Count: ${controller.count}',
          style: TextStyle(fontSize: 30),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
