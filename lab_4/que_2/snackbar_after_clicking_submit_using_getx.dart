import '../../lab_2/card_view/import_export.dart';

class SnackbarAfterClickingSubmitUsingGetx extends StatelessWidget {
  const SnackbarAfterClickingSubmitUsingGetx({super.key});


  void snackBarDemo(){
    Get.snackbar(
      "SnackBar",
      "Button Clicked By You !!!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue[200],
      colorText: Colors.black,
      duration: Duration(seconds: 2),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" ::: Simple Snackabr Demo using the GetX :::!!!"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          snackBarDemo();
        }, child:Text("Click Me !")),
      ),
    );
  }
}
