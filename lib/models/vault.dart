class Vault {
  final String symbol;
  final String logoUrl;
  final String mint;
  final String pythOracle;
  final int decimals;
  final double initialBalance;
  final double currentBalance;
  final double apy;

  Vault(
      {required this.symbol,
      required this.logoUrl,
      required this.mint,
      required this.pythOracle,
      required this.decimals,
      required this.initialBalance,
      required this.currentBalance,
      required this.apy});

  factory Vault.fromJson(Map<String, dynamic> json) {
    return Vault(
      symbol: json['symbol'], 
      logoUrl: json['logoUrl'], 
      mint: json['mint'], 
      pythOracle: json['pyth_oracle'], 
      decimals: json['decimals'], 
      initialBalance: json['initial_balance'],
      currentBalance: json['current_balance'], 
      apy: json['apy'], 
    );
  }
}
