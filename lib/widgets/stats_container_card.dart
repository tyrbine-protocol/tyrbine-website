import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tyrbine_website/models/stats.dart';
import 'package:tyrbine_website/service/config.dart';
import 'package:tyrbine_website/utils/extensions.dart';
import 'package:tyrbine_website/widgets/custom_inkwell.dart';
import 'dart:js' as js;

class StatsContainerCard extends StatefulWidget {
  final Stats stat;

  const StatsContainerCard({super.key, required this.stat});

  @override
  StatsContainerCardState createState() => StatsContainerCardState();
}

class StatsContainerCardState extends State<StatsContainerCard> {

  @override
  Widget build(BuildContext context) {
    final tvl = widget.stat.usdTvl;
    final parts = tvl.toStringAsFixed(2).split('.');  
    final whole = int.parse(parts[0]).formatNumWithCommas();  
    final decimals = parts[1];
    return Container(
      width: 400.0,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.shade600, width: 0.15),
      ),
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
                  Row(
                    children: [
                      const Text('Treasury balance',
                          style: TextStyle(color: Color(0xFF5F5B5B))),
                      const SizedBox(width: 8.0),
                      CustomInkWell(
                        onTap: () => js.context.callMethod('open', ['https://orb.helius.dev/address/${widget.stat.treasuryAddress}?cluster=${SolanaConfig.cluster}&tab=summary']),
                        child: Container(
                          height: 18.0,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1)
                          ),
                          child: Text(widget.stat.treasuryAddress.cutText(), style: TextStyle(fontSize: 11.0, color: Colors.grey.withOpacity(0.5))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('\$$whole',
                          style: const TextStyle(fontSize: 26.0)),
                        const SizedBox(width: 2.0),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text('.$decimals',
                            style: TextStyle(fontSize: 22.0, color: Colors.grey.shade800)),
                        ),
                    ],
                  ),
                ],
              ),
              SvgPicture.asset("assets/icons/tyrb_abstr.svg", height: 50.0, width: 50.0)
            ],
          ),
        ],
      ),
    );
  }
}
