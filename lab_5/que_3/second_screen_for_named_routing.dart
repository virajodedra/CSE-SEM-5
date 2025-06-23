import '../../lab_2/card_view/import_export.dart';

class SecondScreenForNamedRouting extends StatefulWidget {
  const SecondScreenForNamedRouting({super.key});

  @override
  State<SecondScreenForNamedRouting> createState() => _SecondScreenForNamedRoutingState();
}

class _SecondScreenForNamedRoutingState extends State<SecondScreenForNamedRouting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen Navigated by the Named Routing !!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(Get.arguments.toString()),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  Get.back();
                }, child: Text("Click Me ! To Navigate in the First Screen !! ")),
                ElevatedButton(onPressed: () {
                  Get.offAllNamed('/');
                }, child: Text("Home (replace Stack ) "))
              ],
            )
          ],
        ),
      ),
    );
  }
}
