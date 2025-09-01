import 'package:flutter/material.dart';

class SmallScreenWidget extends StatelessWidget {
  const SmallScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      padding: const EdgeInsets.all(20),
      child: const Text(
        " This is Small Screen (Mobile)",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
