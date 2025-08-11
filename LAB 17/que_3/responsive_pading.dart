import 'package:flutter/material.dart';

void main() {
  runApp(ResponsivePaddingApp());
}

class ResponsivePaddingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsivePaddingView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ResponsivePaddingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    double horizontalPadding = screenWidth * 0.1;
    double verticalPadding = screenHeight * 0.05;

    return Scaffold(
      appBar: AppBar(title: Text("Responsive Padding Example")),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Container(
          color: Colors.blue,
          child: Center(
            child: Text(
              "This box has responsive padding!",
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
