import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:solana/solana.dart';
import 'package:tyrbine_website/adapter/adapter.dart';
import 'package:tyrbine_website/models/staked.dart';
import 'package:tyrbine_website/models/tx_status.dart';
import 'package:tyrbine_website/service/config.dart';
import 'package:tyrbine_website/service/tyrbine_program.dart';


Future unstaking(BuildContext context, {required Adapter adapter, required Staked stake, required ValueNotifier<TxStatus> status, required String amountText}) async {
  status.value = TxStatus(status: 'Awaiting approve');

  final amount = (num.parse(amountText) * pow(10, stake.decimals)).toInt();
  
  final message = await TyrbineProgram.unstaking(signer: adapter.pubkey!, stake: stake, amount: amount);
  
  final hash = await solanaClient.rpcClient.getLatestBlockhash();

  final compiledMessage = message.compileV0(recentBlockhash: hash.value.blockhash, feePayer: Ed25519HDPublicKey.fromBase58(adapter.pubkey!));
  
  List<int> tx = List.generate(65, (i) => i == 0 ? 1 : 0);
  tx.addAll(compiledMessage.toByteArray());
  try {
    final signature = await adapter.signAndSendTransaction(Uint8List.fromList(tx));
    status.value = TxStatus(status: 'Sending transaction', signature: 'https://solscan.io/tx/$signature?cluster=devnet');
    await Future.delayed(const Duration(seconds: 10));
    status.value = TxStatus(status: 'Success', signature: 'https://solscan.io/tx/$signature?cluster=devnet');
  } catch (_) {
    status.value = TxStatus(status: 'Rejected');
  }
}