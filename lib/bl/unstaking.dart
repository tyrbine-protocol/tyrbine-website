import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:solana/solana.dart';
import 'package:tyrbine_website/adapter/adapter.dart';
import 'package:tyrbine_website/dialogs/transaction_dialog.dart';
import 'package:tyrbine_website/models/staked.dart';
import 'package:tyrbine_website/service/config.dart';
import 'package:tyrbine_website/service/tyrbine_program.dart';


Future unstaking(BuildContext context, {required Adapter adapter, required Staked stake, required String amountText}) async {
  final status = ValueNotifier<String>('Awaiting approve');
  final solscanUrl = ValueNotifier<String?>(null);
  showTransactionDialog(context, status, solscanUrl, onRetry: () => unstaking(context, adapter: adapter, stake: stake, amountText: amountText));
  final amount = (num.parse(amountText) * pow(10, stake.decimals)).toInt();
  
  final message = await TyrbineProgram.unstaking(signer: adapter.pubkey!, stake: stake, amount: amount);
  
  final hash = await solanaClient.rpcClient.getLatestBlockhash();

  final compiledMessage = message.compileV0(recentBlockhash: hash.value.blockhash, feePayer: Ed25519HDPublicKey.fromBase58(adapter.pubkey!));
  
  List<int> tx = List.generate(65, (i) => i == 0 ? 1 : 0);
  tx.addAll(compiledMessage.toByteArray());
  try {
    final signature = await adapter.signAndSendTransaction(Uint8List.fromList(tx));
    solscanUrl.value = 'https://solscan.io/tx/$signature?cluster=devnet';
    status.value = 'Sending transaction...';
    await Future.delayed(const Duration(seconds: 10));
    status.value = 'Success';
  } catch (_) {
    status.value = 'Rejected';  }
}