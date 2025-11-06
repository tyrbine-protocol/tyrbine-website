import 'package:flutter/material.dart';
import 'package:tyrbine_website/adapter/adapter.dart';
import 'package:tyrbine_website/models/staked.dart';
import 'package:tyrbine_website/widgets/custom_inkwell.dart';

class StakesList extends StatelessWidget {
  final List<Staked> stakes;
  final Adapter adapter;

  const StakesList({super.key, required this.stakes, required this.adapter});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: stakes.map((stake) {
        return Card(
          color: Colors.transparent,
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 8.0),
            child: Container(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 16.0, bottom: 8.0),
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF090909),
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(0.05)
                            ),
                            child: Image.network(
                                        stake.logoUrl,
                                        width: 21.0,
                                        height: 21.0,
                                        errorBuilder: (context, error, stackTrace) =>
                                            const Icon(Icons.error),
                                      ),
                          ),
                          const SizedBox(width: 16.0),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                            'Staked',
                            style: TextStyle(color: Colors.grey.shade700, fontSize: 15.0),
                          ),
                              const SizedBox(width: 8.0),
                              Text(stake.uiAmount, style: const TextStyle(fontSize: 15.0)),
                              const SizedBox(width: 8.0),
                              Text(stake.symbol, style: const TextStyle(fontSize: 15.0)),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                            'Earned',
                            style: TextStyle(color: Colors.grey.shade700, fontSize: 15.0),
                          ),
                              const SizedBox(width: 8.0),
                              Text(stake.earned.toString(), style: const TextStyle(fontSize: 15.0)),
                              const SizedBox(width: 8.0),
                              Text(stake.symbol, style: const TextStyle(fontSize: 15.0)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomInkWell(
                    // Add dialog menu
                    onTap: () {},
                    child: Icon(Icons.more_vert, color: Colors.grey.shade800)),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
