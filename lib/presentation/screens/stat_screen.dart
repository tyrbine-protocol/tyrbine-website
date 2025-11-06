import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tyrbine_website/models/stats.dart';
import 'package:tyrbine_website/models/vault.dart';
import 'package:tyrbine_website/presentation/basement/basement_web_widget.dart';
import 'package:tyrbine_website/utils/extensions.dart';
import 'package:tyrbine_website/widgets/custom_back_button.dart';
import 'package:tyrbine_website/widgets/custom_button.dart';
import 'package:tyrbine_website/widgets/dashline_painter.dart';

class StatScreen extends StatelessWidget {
  StatScreen({super.key});

  final Stats stat = Stats(
      totalTvl: 0,
      dailyChangeTvlAmount: 0,
      dailyChangeTvlPercent: 0,
      vaults: [
        Vault(
            symbol: "SOL",
            logoUrl:
                "https://dekcvgy3g3qg5gnsuq24twpa7jglox5apyalptj56xmeyylxa4ua.arweave.net/GRQqmxs24G6ZsqQ1ydng-ky3X6B-ALfNPfXYTGF3Byg",
            mint: "So11111111111111111111111111111111111111112",
            pythOracle: "7UVimffxr9ow1uXYxsr4LHAcV58mLzhmwaeKvJ1pjLiE",
            decimals: 9,
            tvl: 100,
            apy: 21.2),
        Vault(
            symbol: "USDC",
            logoUrl:
                "https://b344wyhbrdnc7gdusakm3jbzg2nnwsw57uzeedcdlvsaqnxlcjfq.arweave.net/DvnLYOGI2i-YdJAUzaQ5NprbSt39MkIMQ11kCDbrEks",
            mint:
                "Gh9ZwEmdLJ8DscKNTkTqPbNwLNNBjuSzaG9Vp2KGtKJr", // EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v [mainnet]
            pythOracle: "Dpw1EAVrSB1ibxiDQyTAW6Zip3J4Btk2x4SgApQCeFbX",
            decimals: 6,
            tvl: 100,
            apy: 13.7),
      ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 280.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomBackButton(),
                CustomButton(
                  title: 'Staking',
                  iconData: Icons.add,
                  onTap: () => context.go('/'),
                )
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 400.0,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Colors.grey.shade600, width: 0.15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Total Value Locked',
                                      style:
                                          TextStyle(color: Color(0xFF5F5B5B))),
                                  Text(
                                      '\$${stat.totalTvl.formatNumWithCommas()}',
                                      style: const TextStyle(fontSize: 26.0)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                            stat.dailyChangeTvlAmount >= 0
                                                ? 'assets/icons/arrow_up.png'
                                                : 'assets/icons/arrow_down.png',
                                            height: 15.0,
                                            width: 15.0),
                                        const SizedBox(width: 8.0),
                                        Text('${stat.dailyChangeTvlPercent}%',
                                            style: const TextStyle(
                                                color: Color(0xFF5F5B5B),
                                                fontSize: 14.0)),
                                        const SizedBox(width: 8.0),
                                        const Text('·',
                                            style: TextStyle(
                                                color: Color(0xFF5F5B5B),
                                                fontSize: 14.0)),
                                        const SizedBox(width: 8.0),
                                        Text(
                                            stat.dailyChangeTvlAmount >= 0
                                                ? '+\$${stat.dailyChangeTvlAmount.formatNumWithCommas()}'
                                                : '-\$${stat.dailyChangeTvlAmount.abs().formatNumWithCommas()}',
                                            style: TextStyle(
                                                color:
                                                    stat.dailyChangeTvlAmount >=
                                                            0
                                                        ? Colors.greenAccent
                                                        : Colors.red,
                                                fontSize: 14.0)),
                                        const SizedBox(width: 8.0),
                                        const Text('last 24h',
                                            style: TextStyle(
                                                color: Color(0xFF5F5B5B),
                                                fontSize: 14.0)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 40.0,
                                width: 40.0,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF1C1C1C),
                                      Color(0xFF121212)
                                    ]),
                                    shape: BoxShape.circle),
                                child: Image.asset('assets/icons/lock_icon.png',
                                    height: 18.0, width: 18.0),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Container(
                      width: 400.0,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Colors.grey.shade600, width: 0.15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Trading Volume',
                                      style:
                                          TextStyle(color: Color(0xFF5F5B5B))),
                                  Text(
                                      '\$${stat.totalTvl.formatNumWithCommas()}',
                                      style: const TextStyle(fontSize: 26.0)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                            stat.dailyChangeTvlAmount >= 0
                                                ? 'assets/icons/arrow_up.png'
                                                : 'assets/icons/arrow_down.png',
                                            height: 15.0,
                                            width: 15.0),
                                        const SizedBox(width: 8.0),
                                        Text('${stat.dailyChangeTvlPercent}%',
                                            style: const TextStyle(
                                                color: Color(0xFF5F5B5B),
                                                fontSize: 14.0)),
                                        const SizedBox(width: 8.0),
                                        const Text('·',
                                            style: TextStyle(
                                                color: Color(0xFF5F5B5B),
                                                fontSize: 14.0)),
                                        const SizedBox(width: 8.0),
                                        Text(
                                            stat.dailyChangeTvlAmount >= 0
                                                ? '+\$${stat.dailyChangeTvlAmount.formatNumWithCommas()}'
                                                : '-\$${stat.dailyChangeTvlAmount.abs().formatNumWithCommas()}',
                                            style: TextStyle(
                                                color:
                                                    stat.dailyChangeTvlAmount >=
                                                            0
                                                        ? Colors.greenAccent
                                                        : Colors.red,
                                                fontSize: 14.0)),
                                        const SizedBox(width: 8.0),
                                        const Text('last 24h',
                                            style: TextStyle(
                                                color: Color(0xFF5F5B5B),
                                                fontSize: 14.0)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 40.0,
                                width: 40.0,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF1C1C1C),
                                      Color(0xFF121212)
                                    ]),
                                    shape: BoxShape.circle),
                                child: Image.asset('assets/icons/trading_icon.png',
                                    height: 18.0, width: 18.0),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 160.0,
                      width: 350.0,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.grey.shade900)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total Stakers',
                              style: TextStyle(color: Color(0xFF5F5B5B))),
                          Text("0", style: TextStyle(fontSize: 64.0))
                        ],
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Container(
                      height: 160.0,
                      width: 450.0,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey.shade900),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Vaults balancer',
                            style: TextStyle(color: Color(0xFF5F5B5B)),
                          ),
                          const SizedBox(height: 16.0),

                          // Stack с пунктиром и колонками
                          Expanded(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Пунктирная линия (всегда по центру)
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: 0.2,
                                      width: double.infinity,
                                      child: CustomPaint(
                                        painter: DashLinePainter(),
                                      ),
                                    ),
                                  ),
                                ),

                                // Столбцы (динамическая высота)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: stat.vaults.map((vlt) {
                                     
                                      const double maxHeight =
                                          46.0;
                                      const double midHeight =
                                          23.0;
                                      const double minHeight =
                                          0.01;
                                      // vlt.currentLiquidity / vlt.initialLiquidity
                                      final double ratio = (vlt.tvl / 100);

                                      double barHeight = midHeight * ratio;
                                      barHeight = barHeight.clamp(minHeight, maxHeight);

                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0, top: 12.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: barHeight,
                                              width: 15.0,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(height: 6.0),
                                            Image.network(
                                              vlt.logoUrl,
                                              height: 15.0,
                                              width: 15.0,
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 400.0,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Colors.grey.shade600, width: 0.15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('LP Income',
                                      style:
                                          TextStyle(color: Color(0xFF5F5B5B))),
                                  Text(
                                      '\$${stat.totalTvl.formatNumWithCommas()}',
                                      style: const TextStyle(fontSize: 26.0)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                            stat.dailyChangeTvlAmount >= 0
                                                ? 'assets/icons/arrow_up.png'
                                                : 'assets/icons/arrow_down.png',
                                            height: 15.0,
                                            width: 15.0),
                                        const SizedBox(width: 8.0),
                                        Text('${stat.dailyChangeTvlPercent}%',
                                            style: const TextStyle(
                                                color: Color(0xFF5F5B5B),
                                                fontSize: 14.0)),
                                        const SizedBox(width: 8.0),
                                        const Text('·',
                                            style: TextStyle(
                                                color: Color(0xFF5F5B5B),
                                                fontSize: 14.0)),
                                        const SizedBox(width: 8.0),
                                        Text(
                                            stat.dailyChangeTvlAmount >= 0
                                                ? '+\$${stat.dailyChangeTvlAmount.formatNumWithCommas()}'
                                                : '-\$${stat.dailyChangeTvlAmount.abs().formatNumWithCommas()}',
                                            style: TextStyle(
                                                color:
                                                    stat.dailyChangeTvlAmount >=
                                                            0
                                                        ? Colors.greenAccent
                                                        : Colors.red,
                                                fontSize: 14.0)),
                                        const SizedBox(width: 8.0),
                                        const Text('last 24h',
                                            style: TextStyle(
                                                color: Color(0xFF5F5B5B),
                                                fontSize: 14.0)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 40.0,
                                width: 40.0,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF1C1C1C),
                                      Color(0xFF121212)
                                    ]),
                                    shape: BoxShape.circle),
                                child: Image.asset(
                                    'assets/icons/income_icon.png',
                                    height: 18.0,
                                    width: 18.0),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Container(
                      width: 400.0,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Colors.grey.shade600, width: 0.15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('DAO Income',
                                      style:
                                          TextStyle(color: Color(0xFF5F5B5B))),
                                  Text(
                                      '\$${stat.totalTvl.formatNumWithCommas()}',
                                      style: const TextStyle(fontSize: 26.0)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                            stat.dailyChangeTvlAmount >= 0
                                                ? 'assets/icons/arrow_up.png'
                                                : 'assets/icons/arrow_down.png',
                                            height: 15.0,
                                            width: 15.0),
                                        const SizedBox(width: 8.0),
                                        Text('${stat.dailyChangeTvlPercent}%',
                                            style: const TextStyle(
                                                color: Color(0xFF5F5B5B),
                                                fontSize: 14.0)),
                                        const SizedBox(width: 8.0),
                                        const Text('·',
                                            style: TextStyle(
                                                color: Color(0xFF5F5B5B),
                                                fontSize: 14.0)),
                                        const SizedBox(width: 8.0),
                                        Text(
                                            stat.dailyChangeTvlAmount >= 0
                                                ? '+\$${stat.dailyChangeTvlAmount.formatNumWithCommas()}'
                                                : '-\$${stat.dailyChangeTvlAmount.abs().formatNumWithCommas()}',
                                            style: TextStyle(
                                                color:
                                                    stat.dailyChangeTvlAmount >=
                                                            0
                                                        ? Colors.greenAccent
                                                        : Colors.red,
                                                fontSize: 14.0)),
                                        const SizedBox(width: 8.0),
                                        const Text('last 24h',
                                            style: TextStyle(
                                                color: Color(0xFF5F5B5B),
                                                fontSize: 14.0)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 40.0,
                                width: 40.0,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF1C1C1C),
                                      Color(0xFF121212)
                                    ]),
                                    shape: BoxShape.circle),
                                child: Image.asset(
                                    'assets/icons/builder_icon.png',
                                    height: 18.0,
                                    width: 18.0),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(),
          const BasementWebWidget(),
        ],
      ),
    );
  }
}
