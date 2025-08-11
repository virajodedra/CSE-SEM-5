import 'package:flutter/material.dart';

void main() {
  runApp(ScreenSizeApp());
}

class ScreenSizeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenSizeView(),
    );
  }
}

class ScreenSizeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Screen Size with MediaQuery"),
      ),
      body: Center(
        child: Text(
          "Width: $width px\nHeight: $height px",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
