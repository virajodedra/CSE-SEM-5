import 'package:get/get.dart';
import 'grid_item_model.dart';

class GridController extends GetxController {
  final items = <GridItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }

  void loadItems() {
    items.addAll([
      GridItem(title: "Item 1", imageUrl: "https://via.placeholder.com/150"),
      GridItem(title: "Item 2", imageUrl: "https://via.placeholder.com/150"),
      GridItem(title: "Item 3", imageUrl: "https://via.placeholder.com/150"),
      GridItem(title: "Item 4", imageUrl: "https://via.placeholder.com/150"),
      GridItem(title: "Item 5", imageUrl: "https://via.placeholder.com/150"),
    ]);
  }

  /// Responsive column count logic
  int getCrossAxisCount(double width) {
    if (width < 600) return 2; // Mobile
    if (width < 900) return 3; // Tablet
    return 4; // Desktop
  }
}
