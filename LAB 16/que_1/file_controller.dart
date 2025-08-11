import 'package:advance_flutter/lab_16/que_1/file_services.dart';
import 'package:get/get.dart';

class FileController extends GetxController{
  FileServices services = new FileServices();
  var isLoading = false.obs;
  var fileContent = ''.obs;


  void writeFileData(String fileName, String content) async{
    try{
      isLoading.value = true;
      await services.writeFile(fileName, content);
      fileContent.value = "File '${fileName}' created successfully !!";
    }
    catch(e){
      print(e);
    }
    finally{
      isLoading.value = false;
    }
  }


  void readFileData(String fileName) async{
    try{
      isLoading.value = true;
      String content = await services.readFile(fileName);
      fileContent.value  = content;
    }
    catch(e){
      print(e);
      // errorMsg.value = e.toString();
    }
    finally{
      isLoading.value = false;
    }
  }
}