import '../../lab_2/card_view/import_export.dart';

class bottomSheetWithListOfData extends StatelessWidget {
  const bottomSheetWithListOfData({super.key});

  void modalBottomSheet(){
    Get.bottomSheet(
      enterBottomSheetDuration: Duration(seconds: 2),
      exitBottomSheetDuration: Duration(seconds: 1),
      BottomSheet(onClosing: () {
        // Get.back();
      }, builder: (context) {
        return Container(
            height: 250,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select any options : ", style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.list),
                        title: Text('Item ${index + 1}'),
                        onTap: () {
                          Get.back();
                          Get.snackbar(
                            "SuccessFully Selected ${index + 1}",
                            "Button Clicked By You !!!",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.blue[100],
                            colorText: Colors.black,
                            duration: Duration(seconds: 1),
                          );
                        },
                      );
                    },
                      itemCount: 6,),
                  )
                ]
            )
        );
      },)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("This is the bottom sheet demo using the GetX !!"),),
      body: Center(
        child: ElevatedButton(onPressed: () {
          modalBottomSheet();
        }, child: Text("Click Me  !")),
      ),
    );
  }
}
