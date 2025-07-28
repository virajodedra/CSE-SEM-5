import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/async_controller.dart';

class AsyncView extends StatefulWidget {

   AsyncView({super.key});

  @override
  State<AsyncView> createState() => _AsyncViewState();
}

class _AsyncViewState extends State<AsyncView> {
  final AsyncController controller = Get.put(AsyncController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Async Exception Handler")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Obx(() {
                if (controller.isLoading.value) {
                  return CircularProgressIndicator();
                }
                return Text(
                  controller.result.value?.temp ?? "Press button to start",
                  style: TextStyle(fontSize: 18),
                );
              }),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: controller.fetchData,
                child: Text("Fetch Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
