import '../../lab_2/card_view/import_export.dart';

class SecondScreenWithSpecificTransitions extends StatefulWidget {
  const SecondScreenWithSpecificTransitions({super.key});

  @override
  State<SecondScreenWithSpecificTransitions> createState() => _SecondScreenWithSpecificTransitionsState();
}

class _SecondScreenWithSpecificTransitionsState extends State<SecondScreenWithSpecificTransitions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen With the Transitions Effects '),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              Get.back();
            }, child: Text('Click To Go Back !'))
          ],
        ),
      ),
    );
  }
}
