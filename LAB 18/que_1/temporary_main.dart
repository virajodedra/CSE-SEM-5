import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'grid_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Grid',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GridScreen(),
    );
  }
}
