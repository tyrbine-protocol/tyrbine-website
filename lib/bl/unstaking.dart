// import 'dart:math';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:solana/solana.dart';
// import 'package:tyrbine_website/adapter/adapter.dart';
// import 'package:tyrbine_website/models/vault.dart';
// import 'package:tyrbine_website/service/config.dart';
// import 'package:tyrbine_website/service/tyrbine_program.dart';
// import 'package:tyrbine_website/utils/extensions.dart';


// Future unstaking(BuildContext context, {required Adapter adapter, required Vault vault, required String amountText}) async {
//   Toastification.processing('Awaiting approve');
//   final amount = (num.parse(amountText) * pow(10, vault.decimals)).toInt();
  
//   final message = await TyrbineProgram.unstaking(signer: adapter.pubkey!, vault: vault, amount: amount);
  
//   final hash = await solanaClient.rpcClient.getLatestBlockhash();

//   final compiledMessage = message.compileV0(recentBlockhash: hash.value.blockhash, feePayer: Ed25519HDPublicKey.fromBase58(adapter.pubkey!));
  
//   List<int> tx = List.generate(65, (i) => i == 0 ? 1 : 0);
//   tx.addAll(compiledMessage.toByteArray());
//   try {
//     final signature = await adapter.signAndSendTransaction(Uint8List.fromList(tx));
//     Toastification.processing(signature.cutText());
//     await Future.delayed(const Duration(seconds: 10));
//     Toastification.success(signature, duration: 5);
//   } catch (_) {
//     Toastification.error("Rejected");
//   }
// }