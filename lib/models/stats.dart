class Vault {
  final String mint;
  final String pythOracle;
  final String symbol;
  final String logoUrl;
  final int decimals;
  final num tvl;
  final num apr;

  Vault({
    required this.mint,
    required this.pythOracle,
    required this.symbol,
    required this.logoUrl,
    required this.decimals,
    required this.tvl,
    required this.apr,
  });

  factory Vault.fromJson(Map<String, dynamic> json) {
    return Vault(
      mint: json['mint'] as String,
      pythOracle: json['pythOracle'] as String,
      symbol: json['symbol'] as String,
      logoUrl: json['logoUrl'] as String,
      decimals: json['decimals'] as int,
      tvl: json['tvl'] as num,
      apr: json['apr'] as num,
    );
  }

  Map<String, dynamic> toJson() => {
        'mint': mint,
        'symbol': symbol,
        'logoUrl': logoUrl,
        'tvl': tvl,
        'apr': apr,
      };
}

class Stats {
  final num usdTvl;
  final List<Vault> vaults;

  Stats({
    required this.usdTvl,
    required this.vaults,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    final vaultsList = json['vaults'] as List<dynamic>;
    return Stats(
      usdTvl: json['usdTvl'] as num,
      vaults: vaultsList.map((v) => Vault.fromJson(v)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'usdTvl': usdTvl,
        'vaults': vaults.map((v) => v.toJson()).toList(),
      };
}
