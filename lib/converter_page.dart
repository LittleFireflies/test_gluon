import 'package:flutter/material.dart';

class ConverterPage extends StatelessWidget {
  final String username;

  const ConverterPage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter App'),
      ),
      body: Center(
        child: Text('Hello, $username'),
      ),
    );
  }
}
