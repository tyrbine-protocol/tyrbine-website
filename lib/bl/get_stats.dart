import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solana/solana.dart';
import 'package:tyrbine_website/models/stats.dart';
import 'package:tyrbine_website/service/custom_api.dart';
import 'package:tyrbine_website/service/tyrbine_program.dart';

final statsProvider = FutureProvider<Stats?>((ref) async {
  return await getStats();
});

Future<Stats?> getStats() async {
  final treasuryAddress = await Ed25519HDPublicKey.findProgramAddress(seeds: [
      "tyrbine-seed".codeUnits,
      "treasury-seed".codeUnits,
    ], programId: Ed25519HDPublicKey.fromBase58(TyrbineProgram.programId));

  final vaults = await CustomApi.getVaults();
  
  final usdTreasuryBalance = await CustomApi.getTreasuryBalance(treasuryAddress: treasuryAddress.toBase58(), mints: vaults.map((vlt) => vlt.mint).toList());

  return Stats(
    treasuryAddress: treasuryAddress.toBase58(), 
    usdTreasuryBalance: usdTreasuryBalance, 
    vaults: [
      Vault(
        mint: 'So11111111111111111111111111111111111111112', 
        pythOracle: '7UVimffxr9ow1uXYxsr4LHAcV58mLzhmwaeKvJ1pjLiE', 
        symbol: 'SOL', 
        logoUrl: 'https://dekcvgy3g3qg5gnsuq24twpa7jglox5apyalptj56xmeyylxa4ua.arweave.net/GRQqmxs24G6ZsqQ1ydng-ky3X6B-ALfNPfXYTGF3Byg', 
        decimals: 9, 
        tvl: 0, 
        apr: 0),
      Vault(
        mint: 'Gh9ZwEmdLJ8DscKNTkTqPbNwLNNBjuSzaG9Vp2KGtKJr', 
        pythOracle: 'Dpw1EAVrSB1ibxiDQyTAW6Zip3J4Btk2x4SgApQCeFbX', 
        symbol: 'USDC', 
        logoUrl: 'https://b344wyhbrdnc7gdusakm3jbzg2nnwsw57uzeedcdlvsaqnxlcjfq.arweave.net/DvnLYOGI2i-YdJAUzaQ5NprbSt39MkIMQ11kCDbrEks', 
        decimals: 6, 
        tvl: 0, 
        apr: 0),
    ]
  );
}