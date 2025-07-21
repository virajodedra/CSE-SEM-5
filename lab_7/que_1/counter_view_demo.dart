import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'counter_controller.dart';

class CounterViewDemo extends StatefulWidget {

  const CounterViewDemo({super.key});

  @override
  State<CounterViewDemo> createState() => _CounterViewDemoState();
}

class _CounterViewDemoState extends State<CounterViewDemo> {
  final CounterController c2 = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Rx Variables with Obx() & Obs'),
      ),
            body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              'Count: ${c2.count.value}',
              style:  TextStyle(fontSize: 24),
            )),
             SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: c2.increment,
                  child:  Text('Increment'),
                ),
                 SizedBox(width: 20),
                ElevatedButton(
                  onPressed: c2.decrement,
                  child:  Text('Decrement'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: c2.zero,
                  child: Text('reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}