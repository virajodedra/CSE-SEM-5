
import '../../lab_2/card_view/import_export.dart';

class DialogWithTitleAlertMessageButtonUsingGetx extends StatelessWidget {
  const DialogWithTitleAlertMessageButtonUsingGetx({super.key});

  void showDialogBox(){
    Get.defaultDialog(
      title: "ALERT !!!",
      middleText: "This is the GetX Demo Code Running !!",
      textConfirm: "OK !!",
      textCancel: "Cancel",
      onConfirm: () {
        Get.back();
        print(" ::: SUBMIT Button Clicked :::");
      },
      onCancel: () {
        print("::: CANCEL Button Clicked :::");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("::: Simple GetX Demo :::"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          showDialogBox();
        }, child: Text("Click Me !")),
      ),
    );
  }
}

