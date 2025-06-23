import '../../lab_2/card_view/import_export.dart';

class SecondScreenNavigateDemo extends StatefulWidget {
  const SecondScreenNavigateDemo({super.key});

  @override
  State<SecondScreenNavigateDemo> createState() => _SecondScreenNavigateDemoState();
}

class _SecondScreenNavigateDemoState extends State<SecondScreenNavigateDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen !!!'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              Get.back();
            },
                child: Text(' Enter to go First Screen !!'))
          ],
        ),
      ),
    );
  }
}
