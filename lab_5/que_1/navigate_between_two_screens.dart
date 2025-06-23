import 'package:advance_flutter/lab_5/que_1/second_screen_navigate_demo.dart';
import '../../lab_2/card_view/import_export.dart';

class NavigateBetweenTwoScreens extends StatefulWidget {
  const NavigateBetweenTwoScreens({super.key});

  @override
  State<NavigateBetweenTwoScreens> createState() => _NavigateBetweenTwoScreensState();
}

class _NavigateBetweenTwoScreensState extends State<NavigateBetweenTwoScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('Navigate Between Two Screens Demo '),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              Get.to(SecondScreenNavigateDemo());
            }, child: Text("Second Screen !"))
          ],
        ),
      ),
    );
  }
}
