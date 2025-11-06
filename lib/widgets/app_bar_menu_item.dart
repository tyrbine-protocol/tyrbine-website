import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyrbine_website/widgets/custom_inkwell.dart';

class AppBarMenuItem extends StatefulWidget {
  final String title;
  final Function() onTap;
  final String icon;
  final bool isActive;
  const AppBarMenuItem({super.key, required this.onTap, required this.icon, required this.title, required this.isActive});

  @override
  State<AppBarMenuItem> createState() => _AppBarMenuItemState();
}

class _AppBarMenuItemState extends State<AppBarMenuItem> {

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
        onTap: widget.onTap,
        child: Container(
          height: 25.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: widget.isActive ? BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: const Color(0xFF9971FF),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0.0, 0.0),
                color: Colors.grey.withOpacity(0.2),
              )
            ]
          ) : null,
          child: Row(
            children: [
              SvgPicture.asset(widget.icon, height: 15.0, width: 15.0),
              const SizedBox(width: 8.0),
              Text(widget.title,
                  style: TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w500, color: widget.isActive ? null : const Color(0xFF8C8C8C))),
            ],
          ),
        ));
  }
}
