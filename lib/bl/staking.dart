import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solana/solana.dart';
import 'package:tyrbine_website/adapter/adapter.dart';
import 'package:tyrbine_website/bl/get_staker.dart';
import 'package:tyrbine_website/models/tx_status.dart';
import 'package:tyrbine_website/models/vault.dart';
import 'package:tyrbine_website/service/config.dart';
import 'package:tyrbine_website/service/tyrbine_program.dart';


Future<void> staking(BuildContext context, WidgetRef ref, {required Adapter adapter, required Vault vault, required List<Vault> vaultsData, required ValueNotifier<TxStatus> status, required String amountText}) async {
  status.value = TxStatus(status: 'Awaiting approve');

  final amount = (num.parse(amountText) * pow(10, vault.decimals)).toInt();

  final message = await TyrbineProgram.staking(signer: adapter.pubkey!, vault: vault, amount: amount);
  
  final hash = await solanaClient.rpcClient.getLatestBlockhash();

  final compiledMessage = message.compileV0(recentBlockhash: hash.value.blockhash, feePayer: Ed25519HDPublicKey.fromBase58(adapter.pubkey!));
  
  List<int> tx = List.generate(65, (i) => i == 0 ? 1 : 0);
  tx.addAll(compiledMessage.toByteArray());
  try {
    final signature = await adapter.signAndSendTransaction(Uint8List.fromList(tx));
    status.value = TxStatus(status: 'Sending transaction', signature: 'https://solscan.io/tx/$signature?cluster=devnet');
    await Future.delayed(const Duration(seconds: 10));
    // await solanaClient.waitForSignatureStatus(signature, status: Commitment.finalized, timeout: const Duration(seconds: 30));
    status.value = TxStatus(status: 'Success', signature: 'https://solscan.io/tx/$signature?cluster=devnet');
    
    if (vaultsData.isEmpty) {
      await ref.read(stakerNotifierProvider.notifier).loadStaker(vaultsData: vaultsData, owner: adapter.pubkey!);
    } else {
      await ref.read(stakerNotifierProvider.notifier).loadStakerBackground(vaultsData: vaultsData, owner: adapter.pubkey!);
    }
  } catch (_) {
    status.value = TxStatus(status: 'Rejected');
  }
}