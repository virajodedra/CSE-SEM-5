import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(FileWriteApp());
}

class FileWriteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FileWriteView(),
    );
  }
}

class FileWriteView extends StatefulWidget {
  @override
  State<FileWriteView> createState() => _FileWriteViewState();
}

class _FileWriteViewState extends State<FileWriteView> {
  String status = "Press the button to write data.";

  Future<void> writeToExternalStorage() async {
    // Request storage permission
    if (await Permission.storage.request().isGranted) {
      try {
        // Get external storage directory
        Directory? directory = await getExternalStorageDirectory();

        if (directory != null) {
          String filePath = "${directory.path}/my_file.txt";

          // Write to file
          File file = File(filePath);
          await file.writeAsString("Hello! This file is stored in external storage.");

          setState(() {
            status = "File written successfully at:\n$filePath";
          });
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
      appBar: AppBar(title: Text("Write to External Storage")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(status, textAlign: TextAlign.center),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: writeToExternalStorage,
              child: Text("Write File"),
            ),
          ],
        ),
      ),
    );
  }
}
