import 'dart:math';
import 'package:tyrbine_website/utils/constants.dart';

String truncateToDecimals(num number, int decimals) {
  String result = number.toStringAsFixed(decimals);
  
  if (result.contains('.')) {
    result = result.replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
  }

  return result;
}

String extractValue(String input, String key) {
  final regex = RegExp('$key: ([0-9]+)');
  final match = regex.firstMatch(input);
  return match != null ? match.group(1) ?? '' : '';
}

String? extractErrorMessage(String input) {
  final regex = RegExp('Error Message: ([^,]+)');
  final match = regex.firstMatch(input);
  return match?.group(1);
}

String calculatingEarn({required int amount, required num poolCumulativeYield, required num userLastCumulativeYield, required num initialLiquidity, required int pendingYield, required int decimals}) {
    if (amount == 0) {
      return '0';
    }
    var cumulativeYield = (poolCumulativeYield - userLastCumulativeYield) / cumulativeYieldScaleConstant;
    var cumulativeYieldPerToken = cumulativeYield / initialLiquidity;
    var earn = (amount * cumulativeYieldPerToken + pendingYield) / pow(10, decimals);
    return truncateToDecimals(earn, decimals);
}