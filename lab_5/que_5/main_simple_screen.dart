import '../../lab_2/card_view/import_export.dart';

class MainSimpleScreen extends StatefulWidget {
  const MainSimpleScreen({super.key});

  @override
  State<MainSimpleScreen> createState() => _MainSimpleScreenState();
}

class _MainSimpleScreenState extends State<MainSimpleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main BAsic Screen !!!'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              Get.toNamed('/dashboard');
            }, child: Text("Go To The Dashboard"))
          ],
        ),
      ),
    );
  }
}
