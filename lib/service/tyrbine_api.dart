import 'dart:convert';
import 'package:tyrbine_website/models/stats.dart';
import 'package:http/http.dart' as http;

class TyrbineApi {

  static const _off = {
    "usdTvl": 0,
    "vaults": [
        {
            "mint": "So11111111111111111111111111111111111111112",
            "pythOracle": "7UVimffxr9ow1uXYxsr4LHAcV58mLzhmwaeKvJ1pjLiE",
            "symbol": "SOL",
            "logoUrl": "https://dekcvgy3g3qg5gnsuq24twpa7jglox5apyalptj56xmeyylxa4ua.arweave.net/GRQqmxs24G6ZsqQ1ydng-ky3X6B-ALfNPfXYTGF3Byg",
            "decimals": 9,
            "tvl": 0.0,
            "apr": 0.0
        },
        {
            "mint": "Gh9ZwEmdLJ8DscKNTkTqPbNwLNNBjuSzaG9Vp2KGtKJr",
            "pythOracle": "Dpw1EAVrSB1ibxiDQyTAW6Zip3J4Btk2x4SgApQCeFbX",
            "symbol": "USDC",
            "logoUrl": "https://b344wyhbrdnc7gdusakm3jbzg2nnwsw57uzeedcdlvsaqnxlcjfq.arweave.net/DvnLYOGI2i-YdJAUzaQ5NprbSt39MkIMQ11kCDbrEks",
            "decimals": 6,
            "tvl": 0.0,
            "apr": 0.0
        }
    ]
};

  static Future<Stats?> getStats() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:8080/stats'));
      final Map<String, dynamic> jsonDecode = json.decode(response.body);
      final Stats stat = Stats.fromJson(jsonDecode);
      return stat;
    } catch (e) {
      Exception(["Unable to fetch /stats"]);
      return Stats.fromJson(_off);
    }
  }

}