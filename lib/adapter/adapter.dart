import 'dart:typed_data';
import 'package:js/js_util.dart';
import 'package:tyrbine_website/adapter/wallet_module.dart' as wallet_module;
import 'package:url_launcher/url_launcher.dart';

class Adapter {
  final String name;
  final String logoUrl;
  final String website;
  String? _pubkey;

  Adapter({required this.name, required this.logoUrl, required this.website});

  String? get pubkey => _pubkey;

  Future<bool> connect() async {
    if (!wallet_module.isInstalled(name.toLowerCase())) {
      await launchUrl(Uri.parse(website));
      return false;
    }

    await promiseToFuture(wallet_module.connect(name.toLowerCase()));
    
    if (wallet_module.address().isEmpty) {
      return false;
    }

    _pubkey = wallet_module.address();
    
    return _pubkey != null;
  }

  Future<void> disconnect() async {
    wallet_module.disconnect(name.toLowerCase());
    _pubkey = null;
  }

  Future<String> signAndSendTransaction(Uint8List transaction) async {
    var signature = await promiseToFuture(wallet_module.sendTransaction(name.toLowerCase(), transaction));
    return signature;
  }
}