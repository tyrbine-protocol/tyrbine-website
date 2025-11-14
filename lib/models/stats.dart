import 'package:tyrbine_website/models/vault.dart';

class Stats {
  final double usdTvl24hAgo;
  num? dailyChangeTvlAmount;
  num? dailyChangeTvlPercent;
  List<Vault> vaults;

  Stats({required this.usdTvl24hAgo, required this.dailyChangeTvlAmount, required this.dailyChangeTvlPercent, required this.vaults}) {
    dailyChangeTvlAmount ??= 0;
    dailyChangeTvlPercent ??= 0;
  }

  factory Stats.fromJson(Map<String, dynamic> json) {
    final vaultsList = json['vaults'] as List;
    return Stats(
      usdTvl24hAgo: json['usdTvl24hAgo'], 
      dailyChangeTvlAmount: json['daily_change_tvl_amount'], 
      dailyChangeTvlPercent: json['daily_change_tvl_percent'], 
      vaults: vaultsList.map((value) => Vault.fromJson(value)).toList()
    );
  }
}