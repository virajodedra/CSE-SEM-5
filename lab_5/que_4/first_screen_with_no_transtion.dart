import 'package:advance_flutter/lab_5/que_4/second_screen_with_specific_transitions.dart';

import '../../lab_2/card_view/import_export.dart';

class FirstScreenWithNoTranstion extends StatefulWidget {
  const FirstScreenWithNoTranstion({super.key});

  @override
  State<FirstScreenWithNoTranstion> createState() => _FirstScreenWithNoTranstionState();
}

class _FirstScreenWithNoTranstionState extends State<FirstScreenWithNoTranstion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is The First Screen With No Transitions Effeects !!!'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              Get.toNamed('/second');
            }, child: Text('Click To Watch The Transition Between The Two Screens !!!'))
          ],
        ),
      ),
    );
  }
}
