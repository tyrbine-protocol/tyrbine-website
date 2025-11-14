import 'dart:convert';
import 'package:http/http.dart';
import 'package:solana/dto.dart';
import 'package:solana/solana.dart';
import 'package:tyrbine_website/service/config.dart';
import '../utils/extensions.dart';

class CustomApi {

  static Future<List<Map<String, dynamic>>> _getSplBalance(String address) async {
    final splTokens = await solanaClient.rpcClient.getTokenAccountsByOwner(address, TokenAccountsFilter.byProgramId(TokenProgramType.tokenProgram.programId), commitment: Commitment.processed, encoding: Encoding.jsonParsed);
    final list = splTokens.value.map((token) {
      final parsedData = token.account.data?.toJson()['parsed']['info'];
      final accountData = SplTokenAccountDataInfo.fromJson(parsedData);

      return {
        'mint': accountData.mint,
        'symbol': 'NULL',
        'ata': token.pubkey,
        'lamports': int.parse(accountData.tokenAmount.amount),
        'uiAmount': num.parse(accountData.tokenAmount.uiAmountString!),
        'usdValue': 0,
        'decimals': accountData.tokenAmount.decimals,
        'standard': 'spl-token',
        'price': null
      };
    }).toList();
    return list;
  }

  static Future<Map<String, dynamic>> _getTokensPrice(String mints) async {
    mints = mints.replaceAll(
      'Gh9ZwEmdLJ8DscKNTkTqPbNwLNNBjuSzaG9Vp2KGtKJr',
      'EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v',
    );

    final response = await get(Uri.parse("https://lite-api.jup.ag/price/v3v3?ids=$mints"));
    final Map<String, dynamic> jsonDecode = json.decode(response.body);
    return jsonDecode;
  }
  
  static Future<num> getTreasuryBalance({required String treasuryAddress, required List<String> mints}) async {
    final splBalace = await _getSplBalance(treasuryAddress);

    final tokensPrice = await _getTokensPrice(mints.join(','));

    num totalValueLocked = 0;

    splBalace.forEach((token) {
      final price = num.parse(tokensPrice[token['mint'] == "Gh9ZwEmdLJ8DscKNTkTqPbNwLNNBjuSzaG9Vp2KGtKJr" ? "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v" : token['mint']]?['usdPrice'].toString() ?? '0');
      token['usdValue'] = price * token['uiAmount'];
      totalValueLocked += token['usdValue'];
    });

    return totalValueLocked.trimTo(2);
  }
}