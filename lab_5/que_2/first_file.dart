
import 'package:advance_flutter/lab_5/que_2/second_file.dart';

import '../../lab_2/card_view/import_export.dart';

class NavigateBetweenTwoScreensWithData extends StatefulWidget {
  const NavigateBetweenTwoScreensWithData({super.key});

  @override
  State<NavigateBetweenTwoScreensWithData> createState() => _NavigateBetweenTwoScreensWithDataState();
}

class _NavigateBetweenTwoScreensWithDataState extends State<NavigateBetweenTwoScreensWithData> {
  String message = "Navigated From First Screen";
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
              Get.to(SecondScreenNavigateDemoWithData(), arguments: message);
            }, child: Text("Second Screen !"))
          ],
        ),
      ),
    );
  }
}
