import 'package:flutter/material.dart';

void main() {
  runApp(ScreenTypeApp());
}

class ScreenTypeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenTypeView(),
    );
  }
}

class ScreenTypeView extends StatelessWidget {
  const ScreenTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    bool isWeb = width > 700;

    return Scaffold(
      backgroundColor: isWeb ? Colors.blue : Colors.green,
      body: Center(
        child: Text(
          isWeb ? "WEB View" : "MOBILE View",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
