import 'package:flutter_test/flutter_test.dart';
import 'package:tyrbine_website/utils/extensions.dart';
import 'package:tyrbine_website/utils/global_functions.dart';


void main() {
  
  test("truncate to decimals", () {
    var tr = truncateToDecimals(0.2590001, 6);
    expect(tr, equals('0.259'));
  });

  test("calculating earn", () {
    var earned = calculatingEarn(
      amount: 10000000000, 
      poolCumulativeYield: 309764500, 
      userLastCumulativeYield: 259790500,
      initialLiquidity: 10000000000,
      pendingYield: 0, 
      decimals: 6);

    expect(earned, equals('0.049974'));
  });

  test("calculating earn", () {
    var number = 0.00000137412312321.roundToSignificantFigures(2);

    expect(number, equals(0.0000014));
  });

}