import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solana/solana.dart';
import 'package:tyrbine_website/adapter/adapter.dart';
import 'package:tyrbine_website/dialogs/transaction_dialog.dart';
import 'package:tyrbine_website/models/vault.dart';
import 'package:tyrbine_website/service/config.dart';
import 'package:tyrbine_website/service/tyrbine_program.dart';


Future<void> staking(BuildContext context, {required Adapter adapter, required Vault vault, required String amountText}) async {
  final status = ValueNotifier<String>('Awaiting approve');
  final solscanUrl = ValueNotifier<String?>(null);
  showTransactionDialog(context, status, solscanUrl, onRetry: () => staking(context, adapter: adapter, vault: vault, amountText: amountText));

  final amount = (num.parse(amountText) * pow(10, vault.decimals)).toInt();

  final message = await TyrbineProgram.staking(signer: adapter.pubkey!, vault: vault, amount: amount);
  
  final hash = await solanaClient.rpcClient.getLatestBlockhash();

  final compiledMessage = message.compileV0(recentBlockhash: hash.value.blockhash, feePayer: Ed25519HDPublicKey.fromBase58(adapter.pubkey!));
  
  List<int> tx = List.generate(65, (i) => i == 0 ? 1 : 0);
  tx.addAll(compiledMessage.toByteArray());
  try {
    final signature = await adapter.signAndSendTransaction(Uint8List.fromList(tx));
    solscanUrl.value = 'https://solscan.io/tx/$signature?cluster=devnet';
    status.value = 'Sending transaction...';
    await Future.delayed(const Duration(seconds: 10));
    // await solanaClient.waitForSignatureStatus(signature, status: Commitment.finalized, timeout: const Duration(seconds: 30));
    status.value = 'Success';
  } catch (_) {
    status.value = 'Rejected';
  }
}