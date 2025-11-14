import 'package:tyrbine_website/models/vault.dart';

class Stats {
  num? usdTvl;
  final double usdTvl24hAgo;
  num? dailyChangeTvlAmount;
  num? dailyChangeTvlPercent;
  List<Vault> vaults;

  Stats({this.usdTvl, required this.usdTvl24hAgo, this.dailyChangeTvlAmount, this.dailyChangeTvlPercent, required this.vaults}) {
    dailyChangeTvlAmount ??= 0;
    dailyChangeTvlPercent ??= 0;
  }

  factory Stats.fromJson(Map<String, dynamic> json) {
    final vaultsList = json['vaults'] as List;
    return Stats(
      usdTvl24hAgo: json['usdTvl24hAgo'], 
      vaults: vaultsList.map((value) => Vault.fromJson(value)).toList()
    );
  }
}