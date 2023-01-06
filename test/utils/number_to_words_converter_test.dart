import 'package:flutter_test/flutter_test.dart';
import 'package:test_gluon/utils/number_to_words_converter.dart';

void main() {
  test(
    'should return words description of numbers '
    'when convert is called',
    () {
      expect(NumberToWordsConverter.convert(0), 'zero');
      expect(NumberToWordsConverter.convert(7), 'seven');
      expect(NumberToWordsConverter.convert(12), 'twelve');
      expect(NumberToWordsConverter.convert(123), 'one hundred twenty three');
      expect(NumberToWordsConverter.convert(999999),
          'nine hundred ninety nine thousand nine hundred ninety nine');
    },
  );
}
