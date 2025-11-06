import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:tyrbine_website/models/stats.dart';
import 'package:tyrbine_website/models/vault.dart';

final statsProvider = FutureProvider<Stats>((ref) async {
  return await getStats();
});

Future<Stats> getStats() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:8080/stats'));
      final Map<String, dynamic> jsonDecode = json.decode(response.body);
      return Stats.fromJson(jsonDecode);
    } catch (e) {
      return Stats(
        totalTvl: 0, 
        dailyChangeTvlAmount: 0, 
        dailyChangeTvlPercent: 0, 
        vaults: [
        Vault(
          symbol: "SOL",
          logoUrl: "https://dekcvgy3g3qg5gnsuq24twpa7jglox5apyalptj56xmeyylxa4ua.arweave.net/GRQqmxs24G6ZsqQ1ydng-ky3X6B-ALfNPfXYTGF3Byg",
          mint: "So11111111111111111111111111111111111111112",
          pythOracle: "7UVimffxr9ow1uXYxsr4LHAcV58mLzhmwaeKvJ1pjLiE",
          decimals: 9,
          tvl: 0,
          apy: 21.2),
        Vault(
          symbol: "USDC",
          logoUrl: "https://b344wyhbrdnc7gdusakm3jbzg2nnwsw57uzeedcdlvsaqnxlcjfq.arweave.net/DvnLYOGI2i-YdJAUzaQ5NprbSt39MkIMQ11kCDbrEks",
          mint: "Gh9ZwEmdLJ8DscKNTkTqPbNwLNNBjuSzaG9Vp2KGtKJr", // EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v [mainnet]
          pythOracle: "Dpw1EAVrSB1ibxiDQyTAW6Zip3J4Btk2x4SgApQCeFbX",
          decimals: 6,
          tvl: 0,
          apy: 13.7),
        ]);
    }
}