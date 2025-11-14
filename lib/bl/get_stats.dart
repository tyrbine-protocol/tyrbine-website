import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:solana/solana.dart';
import 'package:tyrbine_website/data/vaults.dart';
import 'package:tyrbine_website/models/stats.dart';
import 'package:tyrbine_website/service/custom_api.dart';
import 'package:tyrbine_website/service/tyrbine_program.dart';
import 'package:tyrbine_website/utils/extensions.dart';

final statsProvider = FutureProvider<Stats>((ref) async {
  return await getStats();
});

Future<Stats> getStats() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:8080/stat'));
      final Map<String, dynamic> jsonDecode = json.decode(response.body);
      Stats stat = Stats.fromJson(jsonDecode);

      var treasury = await Ed25519HDPublicKey.findProgramAddress(seeds: [
        "tyrbine-seed".codeUnits,
        "treasury-seed".codeUnits,
      ], programId: Ed25519HDPublicKey.fromBase58(TyrbineProgram.programId));

      final usdTvl = await CustomApi.getTreasuryBalance(treasuryAddress: treasury.toBase58(), mints: stat.vaults.isNotEmpty ? stat.vaults.map((vlt) => vlt.mint).toList() : vaultsData.map((vlt) => vlt.mint).toList());
      stat.dailyChangeTvlAmount = (usdTvl - stat.usdTvl24hAgo).trimTo(2);
      stat.dailyChangeTvlPercent = ((stat.dailyChangeTvlAmount! / stat.usdTvl24hAgo) * 100).trimTo(2);
      
      if (stat.vaults.isEmpty) stat.vaults = vaultsData;

      return stat;
    } catch (e) {
      return Stats(
        usdTvl24hAgo: 0, 
        dailyChangeTvlAmount: 0,
        dailyChangeTvlPercent: 0,
        vaults: vaultsData);
    }
}