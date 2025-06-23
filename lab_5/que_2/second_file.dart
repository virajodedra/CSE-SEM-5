import '../../lab_2/card_view/import_export.dart';

class SecondScreenNavigateDemoWithData extends StatefulWidget {
  const SecondScreenNavigateDemoWithData({super.key});

  @override
  State<SecondScreenNavigateDemoWithData> createState() => _SecondScreenNavigateDemoWithDataState();
}

class _SecondScreenNavigateDemoWithDataState extends State<SecondScreenNavigateDemoWithData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen !!!'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(Get.arguments),
            SizedBox(height: 25,),
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
