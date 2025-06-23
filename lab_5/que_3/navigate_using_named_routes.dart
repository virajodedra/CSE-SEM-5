import '../../lab_2/card_view/import_export.dart';

class NavigateUsingNamedRoutes extends StatefulWidget {
  const NavigateUsingNamedRoutes({super.key});

  @override
  State<NavigateUsingNamedRoutes> createState() => _NavigateUsingNamedRoutesState();
}

class _NavigateUsingNamedRoutesState extends State<NavigateUsingNamedRoutes> {
  String message = "Hello From the Main Screen  -- viraj";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is the Navigation Using the Named Routs Demo !!'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              Get.toNamed('/second', arguments:  message);
            }, child: Text('Click Me !!'))
          ],
        ),
      ),
    );
  }
}



//  put this in the main.dart file :

// return GetMaterialApp(
//    initialRoute: '/',
//    getPages: [
//      GetPage(name: '/', page: () => NavigateUsingNamedRoutes(),),
//      GetPage(name: '/second', page: () => SecondScreenForNamedRouting(),)
//    ],
// );
