import 'package:flutter/material.dart';
import 'package:test_gluon/keys.dart';
import 'package:test_gluon/utils/number_to_words_converter.dart';
import 'package:test_gluon/widgets/custom_text_field.dart';

class ConverterPage extends StatelessWidget {
  final String username;

  final _inputFieldKey = GlobalKey<FormFieldState>();
  final _inputController = TextEditingController();
  final _outputController = TextEditingController();

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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Hello, $username'),
                    const SizedBox(height: 16),
                    const Text(
                        'Please enter an integer number in the "Input" box and tap on "Convert" to see the equivalent in words appear in the "Output" box'),
                    const SizedBox(height: 16),
                    CustomTextField(
                      key: ConverterPageKeys.inputField,
                      labelText: 'Input',
                      formFieldKey: _inputFieldKey,
                      controller: _inputController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: true,
                      ),
                      onChanged: (value) {
                        _inputFieldKey.currentState?.validate();
                      },
                      validator: (value) {
                        if (value != null) {
                          if (value.length > 15) {
                            return 'Max. 15 digits';
                          }
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 48),
                    CustomTextField(
                      key: ConverterPageKeys.outputField,
                      labelText: 'Output',
                      controller: _outputController,
                      isReadOnly: true,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              key: ConverterPageKeys.convertButton,
              onPressed: () {
                if (_inputFieldKey.currentState?.validate() ?? false) {
                  int inputNumber = int.tryParse(_inputController.text) ?? 0;
                  final output = NumberToWordsConverter.convert(inputNumber);
                  _outputController.text = output;
                }
              },
              child: const Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }
}
