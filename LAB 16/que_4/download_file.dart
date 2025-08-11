import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(DownloadFileApp());
}

class DownloadFileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DownloadFileView(),
    );
  }
}

class DownloadFileView extends StatefulWidget {
  @override
  State<DownloadFileView> createState() => _DownloadFileViewState();
}

class _DownloadFileViewState extends State<DownloadFileView> {
  String status = "Press the button to download file.";

  Future<void> downloadFile() async {
    String fileUrl = "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf"; // Example file
    String fileName = "sample_file.pdf";

    // Request permissions
    if (await Permission.storage.request().isGranted) {
      try {
        // Get external storage directory
        Directory? directory = await getExternalStorageDirectory();

        if (directory != null) {
          String filePath = "${directory.path}/$fileName";

          // Download file
          var response = await http.get(Uri.parse(fileUrl));

          if (response.statusCode == 200) {
            File file = File(filePath);
            await file.writeAsBytes(response.bodyBytes);

            setState(() {
              status = "File downloaded successfully at:\n$filePath";
            });
          } else {
            setState(() {
              status = "Failed to download file. Status code: ${response.statusCode}";
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
      appBar: AppBar(title: Text("Download File to External Storage")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(status, textAlign: TextAlign.center),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: downloadFile,
              child: Text("Download File"),
            ),
          ],
        ),
      ),
    );
  }
}
