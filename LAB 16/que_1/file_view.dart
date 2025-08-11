import 'package:advance_flutter/lab_16/que_1/file_controller.dart';

import '../../lab_2/card_view/import_export.dart';

class FileView extends StatelessWidget {
  FileController controller = Get.put(FileController());
  TextEditingController fileName = TextEditingController();
  TextEditingController contentController = TextEditingController();


  FileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Reading Data From File !!')
      ),
      body: Padding(
        padding:  EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: fileName,
              decoration: const InputDecoration(labelText: "Enter file name"),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              controller.readFileData(fileName.value.toString());
            }, child: Text('Find Content !')),
            SizedBox(height: 20),
            Text(' To create the file and write the content '),
            TextField(
              controller: fileName,
              decoration: const InputDecoration(labelText: "Enter file name"),
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(labelText: "Enter content"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.writeFileData(
                  fileName.text.trim(),
                  contentController.text.trim(),
                );
              },
              child: const Text("Create & Write File"),
            ),

            Obx(() {
              if(controller.isLoading.value){
                return CircularProgressIndicator();
              }
              else if(controller.fileContent.isNotEmpty){
                return SingleChildScrollView(
                  child: Text(controller.fileContent.value),
                );
              }
              else{
                return Text('File Not Found !!');
              }
            },)
          ],
        ),
      )
    );
  }
}
