import 'dart:math';
import 'dart:math' as math;

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String formatNumWithCommas() {
    toString().contains('.')
        ? toString().replaceAll(RegExp(r'0*$'), '')
        : toString();
    List<String> parts = toString().split('.');
    String integerPart = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]},',
    );
    String decimalPart = parts.length > 1 ? '.${parts[1]}' : '';
    return '$integerPart$decimalPart';
  }

  String cutText() {
    if (length < 18) {
      return this;
    }

    String startSymbols = substring(0, 4);
    String endSymbols = substring(length - 7);
    '';
    return '$startSymbols...$endSymbols';
  }
}

extension NumExtension on num {

double trimTo(int digits) {
  final factor = math.pow(10, digits);
  return (this * factor).truncate() / factor;
}

num smartSignificantRound() {
  if (this == 0) return 0;

  // Количество значащих цифр
  int significantDigits = 3;

  // Порядок числа (экспонента)
  int order = (log(abs()) / ln10).floor();

  // Считаем множитель для округления
  double factor = pow(10, significantDigits - 1 - order).toDouble();

  // Округляем
  double rounded = (this * factor).round() / factor;

  // Проверка: нужно ли округлять?
  if (rounded != this) {
    return rounded;
  }

  return this;
}


  String formatNumWithCommas() {
    toString().contains('.')
        ? toString().replaceAll(RegExp(r'0*$'), '')
        : toString();
    List<String> parts = toString().split('.');
    String integerPart = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]},',
    );
    String decimalPart = parts.length > 1 ? '.${parts[1]}' : '';
    return '$integerPart$decimalPart';
  }

  double roundToSignificantFigures(int significantFigures) {
  if (this == 0) return 0;

  int digits = (log(abs()) / log(10)).floor() + 1;

  num scale = pow(10, significantFigures - digits);

  return (this * scale).round() / scale;
  }
}
