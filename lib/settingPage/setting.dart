import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final String title;

  const SettingPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('This is the Settings Page'),
      ),
    );
  }
}
