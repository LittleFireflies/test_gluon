import 'package:flutter/material.dart';
import 'package:test_gluon/converter_page.dart';
import 'package:test_gluon/widgets/custom_text_field.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _usernameFieldKey = GlobalKey<FormFieldState>();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              formFieldKey: _usernameFieldKey,
              labelText: 'Username',
              prefixIcon: const Icon(Icons.person),
              controller: _usernameController,
              onFieldSubmitted: (value) {
                _validateField(_usernameFieldKey);
              },
              validator: (value) {
                if (value != null) {
                  if (value.isEmpty) {
                    return 'Username can not be empty';
                  }

                  if (value.length < 6) {
                    return 'Username should be at least 6 characters';
                  }
                }

                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_validateField(_usernameFieldKey)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConverterPage(
                        username: _usernameController.text,
                      ),
                    ),
                  );
                }
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateField(GlobalKey<FormFieldState> fieldKey) =>
      fieldKey.currentState?.validate() ?? false;
}
