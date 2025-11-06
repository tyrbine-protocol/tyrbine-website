import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:solana/solana.dart';
import 'package:tyrbine_website/adapter/adapter.dart';
import 'package:tyrbine_website/dialogs/transaction_dialog.dart';
import 'package:tyrbine_website/service/config.dart';
import 'package:tyrbine_website/service/tyrbine_program.dart';

Future claim(BuildContext context, {required Adapter adapter, required String mint}) async {
  final status = ValueNotifier<String>('Awaiting approve');
  final solscanUrl = ValueNotifier<String?>(null);
  showTransactionDialog(context, status, solscanUrl, onRetry: () => claim(context, adapter: adapter, mint: mint));

  final message = await TyrbineProgram.claim(signer: adapter.pubkey!, mint: mint);
  
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
    status.value = 'Rejected';
  }
}