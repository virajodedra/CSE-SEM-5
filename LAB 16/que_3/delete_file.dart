import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(DeleteFileApp());
}

class DeleteFileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeleteFileView(),
    );
  }
}

class DeleteFileView extends StatefulWidget {
  @override
  State<DeleteFileView> createState() => _DeleteFileViewState();
}

class _DeleteFileViewState extends State<DeleteFileView> {
  String status = "Press the button to delete file.";

  Future<void> deleteFromExternalStorage() async {
    // Request storage permission
    if (await Permission.storage.request().isGranted) {
      try {
        // Get external storage directory
        Directory? directory = await getExternalStorageDirectory();

        if (directory != null) {
          String filePath = "${directory.path}/my_file.txt";
          File file = File(filePath);

          if (await file.exists()) {
            await file.delete();
            setState(() {
              status = "File deleted successfully from:\n$filePath";
            });
          } else {
            setState(() {
              status = "File does not exist.";
            });
          }
        } else {
          setState(() {
            status = "Could not access external storage directory.";
          });
        }
      } catch (e) {
        setState(() {
          status = "Error: $e";
        });
      }
    } else {
      setState(() {
        status = "Storage permission denied.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delete File from External Storage")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(status, textAlign: TextAlign.center),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: deleteFromExternalStorage,
              child: Text("Delete File"),
            ),
          ],
        ),
      ),
    );
  }
}
