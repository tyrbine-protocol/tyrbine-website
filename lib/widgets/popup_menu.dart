import 'package:flutter/material.dart';
import 'package:tyrbine_website/adapter/adapter.dart';
import 'package:tyrbine_website/bl/claim.dart';
import 'package:tyrbine_website/models/staked.dart';

class PopupMenu extends StatelessWidget {
  final Staked vault;
  final Adapter adapter;
  const PopupMenu({super.key, required this.vault, required this.adapter});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert, color: Colors.white),
      onPressed: () => _showMenu(context),
    );
  }

  void _showMenu(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 220,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.grey.shade900,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(vault.logoUrl, height: 21.0, width: 21.0),
                            const SizedBox(width: 8.0),
                            Text(vault.symbol),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Divider(color: Colors.grey.withOpacity(0.1)),
                      const SizedBox(height: 4.0),
                      _menuButton(context, 'Staking more', 'stake'),
                      _menuButton(context, 'Unstaking', 'unstake'),
                      _menuButton(context, 'Claim', 'claim'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _menuButton(BuildContext context, String label, String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 48),
          alignment: Alignment.centerLeft,
        ),
        onPressed: () async {
          Navigator.pop(context);
          if (label.toLowerCase() == 'claim') {
            await claim(context, adapter: adapter, mint: vault.mint);
          } else if (label.toLowerCase() == 'staking') {

          } else if (label.toLowerCase() == "unstaking") {
            
          }
        },
        child: Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
