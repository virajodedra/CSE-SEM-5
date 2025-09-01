import 'package:flutter/material.dart';

class LargeScreenWidget extends StatelessWidget {
  const LargeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      padding: const EdgeInsets.all(20),
      child: const Text(
        " This is Large Screen (Tablet/Desktop)",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
