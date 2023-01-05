import 'numbers_helper.dart';

class NumberToWordsConverter {
  static String convert(int number) {
    if (number == 0) {
      return zero;
    }

    String numberInString = number.toString().padLeft(15, '0');

    // XXXnnnnnnnnnnnn
    int trillions = int.parse(numberInString.substring(0, 3));
    // nnnXXXnnnnnnnnn
    int billions = int.parse(numberInString.substring(3, 6));
    // nnnnnnXXXnnnnnn
    int millions = int.parse(numberInString.substring(6, 9));
    // nnnnnnnnnXXXnnn
    int hundredThousands = int.parse(numberInString.substring(9, 12));
    // nnnnnnnnnnnnXXX
    int thousands = int.parse(numberInString.substring(12, 15));

    String result = '';

    String trillionsString;
    trillionsString = _getTrillions(trillions);
    result = result + trillionsString;

    String billionsString;
    billionsString = _getBillions(billions);
    result = result + billionsString;

    String millionsString;
    millionsString = _getMillions(millions);
    result = result + millionsString;

    String hundredThousandsString;
    hundredThousandsString = _getThousands(hundredThousands);
    result = result + hundredThousandsString;

    String thousandsString;
    thousandsString = _convertLessThanOneThousand(thousands);

    return result + thousandsString;
  }

  static String _getTrillions(int trillions) {
    if (trillions == 0) {
      return '';
    } else {
      return '${_convertLessThanOneThousand(trillions)} $trillion';
    }
  }

  static String _getBillions(int billions) {
    if (billions == 0) {
      return '';
    } else {
      return '${_convertLessThanOneThousand(billions)} $billion';
    }
  }

  static String _getMillions(int millions) {
    if (millions == 0) {
      return '';
    } else {
      return '${_convertLessThanOneThousand(millions)} $million';
    }
  }

  static String _getThousands(int hundredThousands) {
    if (hundredThousands == 0) {
      return '';
    } else {
      return '${_convertLessThanOneThousand(hundredThousands)} $thousand ';
    }
  }

  static String _convertLessThanOneThousand(int number) {
    String soFar;

    if (number % 100 < 20) {
      soFar = numNames[number % 100];
      number = (number ~/ 100).toInt();
    } else {
      soFar = numNames[number % 10];
      number = (number ~/ 10).toInt();

      soFar = tensNames[number % 10] + soFar;
      number = (number ~/ 10).toInt();
    }

    if (number == 0) {
      return soFar;
    }

    return '${numNames[number]} $hundred $soFar';
  }
}
