import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileServices{

  Future<void> writeFile(String fileName, String content) async{
    final dir = await getExternalStorageDirectory();
    final path = '${dir!.path}/$fileName';

    File file = File(path);

    await file.writeAsString(content, mode: FileMode.append);
  }

  Future<String> readFile(String fileName) async {
    final dir = await getExternalStorageDirectory();
    File file = File("${dir!.path}/$fileName");

    if(await file.exists()){
      return file.readAsString();
    }
    else{
      throw Exception('FIle Not Found !!');
    }
  }
}

