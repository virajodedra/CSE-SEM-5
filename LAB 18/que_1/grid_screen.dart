// lib/view/grid_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'grid_controller.dart';

class GridScreen extends StatelessWidget {
  GridScreen({super.key});

  final controller = Get.put(GridController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Grid")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount =
          controller.getCrossAxisCount(constraints.maxWidth);

          return Obx(
                () => GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: controller.items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                final item = controller.items[index];
                return _GridCard(item: item);
              },
            ),
          );
        },
      ),
    );
  }
}

class _GridCard extends StatelessWidget {
  final dynamic item;

  const _GridCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(item.imageUrl, height: 80, width: 80, fit: BoxFit.cover),
          const SizedBox(height: 10),
          Text(item.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
