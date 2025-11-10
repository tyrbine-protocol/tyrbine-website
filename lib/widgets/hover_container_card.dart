import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tyrbine_website/models/stats.dart';
import 'package:tyrbine_website/utils/extensions.dart';
import 'package:tyrbine_website/widgets/custom_inkwell.dart';

class HoverContainerCard extends StatefulWidget {
  final Stats stat;

  const HoverContainerCard({super.key, required this.stat});

  @override
  HoverContainerCardState createState() => HoverContainerCardState();
}

class HoverContainerCardState extends State<HoverContainerCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: CustomInkWell(
        onTap: () => context.go('/stat'),
        child: Container(
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
                      const Text('Total Value Locked',
                          style: TextStyle(color: Color(0xFF5F5B5B))),
                      Text('\$${widget.stat.totalTvl.formatNumWithCommas()}',
                          style: const TextStyle(fontSize: 26.0)),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              widget.stat.dailyChangeTvlAmount >= 0
                                  ? 'assets/icons/arrow_up.png'
                                  : 'assets/icons/arrow_down.png',
                              height: 15.0,
                              width: 15.0,
                            ),
                            const SizedBox(width: 8.0),
                            Text('${widget.stat.dailyChangeTvlPercent}%',
                                style: const TextStyle(
                                    color: Color(0xFF5F5B5B), fontSize: 14.0)),
                            const SizedBox(width: 8.0),
                            const Text('·',
                                style: TextStyle(
                                    color: Color(0xFF5F5B5B), fontSize: 14.0)),
                            const SizedBox(width: 8.0),
                            Text(
                                widget.stat.dailyChangeTvlAmount >= 0
                                    ? '+\$${widget.stat.dailyChangeTvlAmount.formatNumWithCommas()}'
                                    : '-\$${widget.stat.dailyChangeTvlAmount.abs().formatNumWithCommas()}',
                                style: TextStyle(
                                    color: widget.stat.dailyChangeTvlAmount >= 0
                                        ? Colors.greenAccent
                                        : Colors.red,
                                    fontSize: 14.0)),
                            const SizedBox(width: 8.0),
                            const Text('last 24h',
                                style: TextStyle(
                                    color: Color(0xFF5F5B5B), fontSize: 14.0)),
                          ],
                        ),
                      )
                    ],
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: SvgPicture.asset(
                      isHovered
                          ? 'assets/icons/turbine_active.svg'
                          : 'assets/icons/turbine.svg',
                      key: ValueKey<bool>(isHovered),
                      width: 80.0,
                      height: 80.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
