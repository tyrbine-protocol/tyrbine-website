import 'package:flutter_test/flutter_test.dart';
import 'package:tyrbine_website/bl/get_staker.dart';
import 'package:tyrbine_website/models/staked.dart';
import 'package:tyrbine_website/models/vault.dart';
import 'package:tyrbine_website/utils/extensions.dart';

void main() {

final List<Vault> vaultsData = [
  Vault(
      symbol: "SOL",
      logoUrl: "https://dekcvgy3g3qg5gnsuq24twpa7jglox5apyalptj56xmeyylxa4ua.arweave.net/GRQqmxs24G6ZsqQ1ydng-ky3X6B-ALfNPfXYTGF3Byg",
      mint: "So11111111111111111111111111111111111111112",
      pythOracle: "7UVimffxr9ow1uXYxsr4LHAcV58mLzhmwaeKvJ1pjLiE",
      decimals: 9,
      tvl: 974245.54,
      apy: 21.2),
    Vault(
      symbol: "USDC",
      logoUrl: "https://b344wyhbrdnc7gdusakm3jbzg2nnwsw57uzeedcdlvsaqnxlcjfq.arweave.net/DvnLYOGI2i-YdJAUzaQ5NprbSt39MkIMQ11kCDbrEks",
      mint: "Gh9ZwEmdLJ8DscKNTkTqPbNwLNNBjuSzaG9Vp2KGtKJr", // EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v [mainnet]
      pythOracle: "Dpw1EAVrSB1ibxiDQyTAW6Zip3J4Btk2x4SgApQCeFbX",
      decimals: 6,
      tvl: 1014885.54,
      apy: 13.7),
    // Pool(
    //   symbol: "USDT",
    //   logoUrl: "https://ccdlupml3otto3lav7y5ampaqcwfaxzpmt52vze3xdbe6khkid3q.arweave.net/EIa6PYvbpzdtYK_x0DHggKxQXy9k-6rkm7jCTyjqQPc",
    //   mint: "Gh9ZwEmdLJ8DscKNTkTqPbNwLNNBjuSzaG9Vp2KGtKJr", // EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v [mainnet]
    //   pythOracle: "Dpw1EAVrSB1ibxiDQyTAW6Zip3J4Btk2x4SgApQCeFbX",
    //   decimals: 6),
];
  
  test('get staker', () async {
    final List<Staked> staked = await getStaker(owner: 'Cy89hxcHCuZhyR8Hjc5AZVcsiNXtFXynf4wDHSi7QsTC', vaultsData: vaultsData);
    for (var stake in staked) {
      print("${stake.symbol}: ${stake.earned.trimTo(stake.decimals)}");
    }
});

}