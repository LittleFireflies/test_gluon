import 'package:flutter/material.dart';
import 'package:test_gluon/widgets/custom_text_field.dart';

class ConverterPage extends StatelessWidget {
  final String username;

  final _inputFieldKey = GlobalKey<FormFieldState>();
  final _outputFieldKey = GlobalKey<FormFieldState>();

  ConverterPage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Hello, $username'),
            const SizedBox(height: 16),
            const Text(
                'Please enter an integer number in the "Input" box and tap on "Convert" to see the equivalent in words appear in the "Output" box'),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Input',
              formFieldKey: _inputFieldKey,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
            ),
            const SizedBox(height: 48),
            CustomTextField(
              labelText: 'Output',
              formFieldKey: _outputFieldKey,
              isReadOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
