import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_gluon/converter_page.dart';
import 'package:test_gluon/keys.dart';

void main() {
  testWidgets(
    'should display output '
    'when input number is entered '
    'and convert button is pressed',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ConverterPage(username: 'username'),
        ),
      );

      await tester.enterText(
        find.byKey(ConverterPageKeys.inputField),
        '123',
      );
      await tester.tap(find.byKey(ConverterPageKeys.convertButton));

      await tester.pumpAndSettle();

      expect(find.text('one hundred twenty three'), findsOneWidget);
    },
  );
}
