import 'package:fixnum/fixnum.dart';
import 'package:solana/base58.dart';
import 'package:solana/dto.dart';

class VaultPda {
  final String address;
  final bool isActive;
  final int baseFee;
  final String mint;
  final String pythPriceFeedAccount;
  final String lpTokenMint;
  final int initialLiquidity;
  final int currentLiquidity;
  final int cumulativeYield;
  final int protocolYield;

  VaultPda({required this.address, required this.isActive, required this.baseFee, required this.mint, required this.pythPriceFeedAccount, required this.lpTokenMint, required this.initialLiquidity, required this.cumulativeYield, required this.currentLiquidity, required this.protocolYield});

  factory VaultPda.fromProgramAccount(ProgramAccount programAccount) {
    var binaryAccountData = programAccount.account.data as BinaryAccountData;
    var data = binaryAccountData.data;
    return VaultPda( 
      address: programAccount.pubkey,
      isActive: data.getRange(8, 9).toList()[0] == 1 ? true : false,
      baseFee: Int64.fromBytes(data.getRange(9, 17).toList()).toInt(),
      mint: base58encode(data.getRange(17, 49).toList()), 
      pythPriceFeedAccount: base58encode(data.getRange(49, 81).toList()), 
      lpTokenMint: base58encode(data.getRange(81, 113).toList()), 
      initialLiquidity: Int64.fromBytes(data.getRange(113, 121).toList()).toInt(), 
      currentLiquidity: Int64.fromBytes(data.getRange(121, 129).toList()).toInt(),
      cumulativeYield: Int64.fromBytes(data.getRange(129, 145).toList()).toInt(),
      protocolYield: Int64.fromBytes(data.getRange(145, 153).toList()).toInt()
    );
  }
}