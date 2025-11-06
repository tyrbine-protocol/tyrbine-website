import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tyrbine_website/adapter/wallet_notifier.dart';
import 'package:tyrbine_website/dialogs/wallet_dialog.dart';
import 'package:tyrbine_website/l10n/app_localizations.dart';
import 'package:tyrbine_website/utils/extensions.dart';
import 'package:tyrbine_website/widgets/custom_button.dart';
import 'package:tyrbine_website/widgets/custom_inkwell.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopWebBar extends ConsumerStatefulWidget {
  const TopWebBar({super.key});

  @override
  ConsumerState<TopWebBar> createState() => _TopWebBarState();
}

class _TopWebBarState extends ConsumerState<TopWebBar> {
  OverlayEntry? _tooltipOverlay;

  void _hideTooltip() {
    _tooltipOverlay?.remove();
    _tooltipOverlay = null;
  }

  @override
  Widget build(BuildContext context) {
    final wallet = ref.watch(walletProvider);
    final walletNotifier = ref.read(walletProvider.notifier);
    final isConnected = wallet?.pubkey != null;
    final loc = AppLocalizations.of(context)!;

    return Column(
      children: [
        Container(
          height: 25.0,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xFF7637EC),
          alignment: Alignment.center,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.campaign, color: Color(0xFFBE9EFB)),
              SizedBox(width: 16.0),
              Text('Tyrbine has been launched on Solana Devnet and is undergoing testing prior to its launch on the Solana Mainnet', style: TextStyle(fontSize: 14.0, color: Color(0xFFBE9EFB))),
            ],
          ),
        ),
        Container(
          height: 60.0,
          width: MediaQuery.of(context).size.width,
          decoration:
              BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 280.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/logos/tyr_logo.svg',
                        height: 28.0, width: 28.0),
                    const SizedBox(width: 16.0),
                    const Text('Tyrbine', style: TextStyle(fontSize: 18.0)),
                  ],
                ),
                isConnected
                    ? CustomInkWell(
                        onTap: () => walletNotifier.disconnect(),
                        child: Container(
                          height: 32.0,
                          width: 160.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(wallet!.pubkey!.cutText(),
                                  style: const TextStyle(
                                      color: Colors.redAccent, fontSize: 15.0)),
                              const SizedBox(width: 8.0),
                              const Icon(Icons.power_settings_new,
                                  size: 18.0, color: Colors.redAccent)
                            ],
                          ),
                        ),
                      )
                    : CustomButton(
                        title: loc.connect,
                        iconData: Icons.power,
                        onTap: () => showWalletDialog(context, ref),
                      )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }
}
