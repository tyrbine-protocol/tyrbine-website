import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tyrbine_website/adapter/adapter.dart';
import 'package:tyrbine_website/bl/claim.dart';
import 'package:tyrbine_website/bl/unstaking.dart';
import 'package:tyrbine_website/models/staked.dart';
import 'package:tyrbine_website/presentation/screens/home_mob_screen.dart';
import 'package:tyrbine_website/presentation/screens/home_web_screen.dart';
import 'package:tyrbine_website/widgets/custom_inkwell.dart';

void showStakeDialog(BuildContext context, Staked stake, Adapter adapter, {bool? isMob}) {
  Navigator.maybePop(context);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      TextEditingController unstakeController = TextEditingController();
      bool showUnstakeField = false;

      return StatefulBuilder(
        builder: (context, setState) {
          return Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 384.0,
                height: showUnstakeField ? 380.0 : 300.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                ),
                padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0, bottom: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.05),
                                border: Border.all(color: Colors.grey.withOpacity(0.05)),
                              ),
                              child: Image.network(
                                stake.logoUrl,
                                width: 22.0,
                                height: 22.0,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Text(stake.symbol),
                          ],
                        ),
                        CustomInkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            height: 25.0,
                            width: 55.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.grey.shade900,
                            ),
                            child: const Text(
                              'Esc',
                              style: TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8.0),

                    /// Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Staked',
                                style: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 15.0)),
                            const SizedBox(width: 8.0),
                            Text(stake.uiAmount,
                                style: const TextStyle(fontSize: 15.0)),
                            const SizedBox(width: 8.0),
                            Text(stake.symbol,
                                style: const TextStyle(fontSize: 15.0)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Earned',
                                style: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 15.0)),
                            const SizedBox(width: 8.0),
                            Text(stake.earned.toString(),
                                style: const TextStyle(fontSize: 15.0)),
                            const SizedBox(width: 8.0),
                            Text(stake.symbol,
                                style: const TextStyle(fontSize: 15.0)),
                          ],
                        ),
                      ],
                    ),

                    const Spacer(),

                    /// Action buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        /// +
                        CustomInkWell(
                          onTap: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) {
                                if (isMob != null && isMob) {
                                  return HomeMobScreen(vaultMint: stake.mint);
                                }
                                return HomeWebScreen(vaultMint: stake.mint);
                              },
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          ),
                          child: Container(
                            height: 35.0,
                            width: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              '+',
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ),
                        ),

                        const SizedBox(width: 16.0),

                        /// -
                        CustomInkWell(
                          onTap: () {
                            setState(() {
                              showUnstakeField = !showUnstakeField;
                            });
                          },
                          child: Container(
                            height: 35.0,
                            width: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: showUnstakeField
                                  ? Colors.red.withOpacity(0.15)
                                  : Colors.grey.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              '-',
                              style: TextStyle(
                                color: showUnstakeField
                                    ? Colors.red
                                    : Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 16.0),

                        /// Claim
                        Expanded(
                          child: CustomInkWell(
                            onTap: () async {
                              if (showUnstakeField) {
                                setState(() {
                                  showUnstakeField = false;
                                });
                                await Future.delayed(const Duration(milliseconds: 250));
                              }
                              claim(context, adapter: adapter, mint: stake.mint);
                            },
                            child: Container(
                              height: 35.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: showUnstakeField
                                    ? Colors.grey.withOpacity(0.05)
                                    : Colors.amber,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                'Claim',
                                style: TextStyle(
                                  color: showUnstakeField
                                      ? Colors.grey.shade700
                                      : Colors.amber.shade900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// Unstake field & button
                    if (showUnstakeField) ...[
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: unstakeController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                        ],
                        decoration: InputDecoration(
                          hintText: 'Enter amount to unstake',
                          hintStyle: TextStyle(color: Colors.grey.shade800),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomInkWell(
                              onTap: () => unstakeController.text = stake.uiAmount,
                              child: Container(
                                  height: 35.0,
                                  width: 50.0,
                                  alignment: Alignment.center,
                                  child: const Text('max', style: TextStyle(color: Color(0xFF7637EC)))),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.grey.shade800, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      CustomInkWell(
                        onTap: () {
                          final amount = unstakeController.text.trim();
                          if (amount.isNotEmpty) {
                            unstaking(context, adapter: adapter, stake: stake, amountText: unstakeController.text);
                          }
                        },
                        child: Container(
                          height: 40.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text(
                            'Unstaking',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
