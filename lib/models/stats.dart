import 'package:tyrbine_website/models/vault.dart';

class Stats {
  final double totalTvl;
  final double dailyChangeTvlAmount;
  final double dailyChangeTvlPercent;
  final List<Vault> vaults;

  Stats({required this.totalTvl, required this.dailyChangeTvlAmount, required this.dailyChangeTvlPercent, required this.vaults});

  factory Stats.fromJson(Map<String, dynamic> json) {
    final vaultsList = json['vaults'] as List;
    return Stats(
      totalTvl: json['total_tvl'], 
      dailyChangeTvlAmount: json['daily_change_tvl_amount'], 
      dailyChangeTvlPercent: json['daily_change_tvl_percent'], 
      vaults: vaultsList.map((value) => Vault.fromJson(value)).toList()
    );
  }
}