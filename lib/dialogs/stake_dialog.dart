import 'package:flutter/material.dart';
import 'package:tyrbine_website/adapter/adapter.dart';
import 'package:tyrbine_website/bl/claim.dart';
import 'package:tyrbine_website/models/staked.dart';
import 'package:tyrbine_website/presentation/screens/home_mob_screen.dart';
import 'package:tyrbine_website/presentation/screens/home_web_screen.dart';
import 'package:tyrbine_website/widgets/custom_inkwell.dart';

void showStakeDialog(BuildContext context, Staked stake, Adapter adapter, {bool? isMob}) {
  Navigator.maybePop(context);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 384.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.05),
                          border: Border.all(color: Colors.grey.withOpacity(0.05))),
                      child: Image.network(
                        stake.logoUrl,
                        width: 22.0,
                        height: 22.0,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Text(stake.symbol)
                  ],
                ),
                const SizedBox(height: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Staked',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 15.0),
                        ),
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
                        Text(
                          'Earned',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 15.0),
                        ),
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
                Container(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
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
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Text('+', style: TextStyle(color: Colors.grey.shade700)))),
                        const SizedBox(width: 16.0),
                        Container(
                          height: 35.0,
                          width: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Text('-', style: TextStyle(color: Colors.grey.shade700))),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: CustomInkWell(
                          onTap: () => claim(context, adapter: adapter, mint: stake.mint),
                          child: Container(
                              height: 35.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Text('Claim', style: TextStyle(color: Colors.amber.shade900))),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
