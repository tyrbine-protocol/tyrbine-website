import 'package:flutter/material.dart';
import 'package:tyrbine_website/widgets/custom_inkwell.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final IconData iconData;
  final Function() onTap;
  final double? height;
  final double? width;
  const CustomButton({super.key, required this.title, required this.iconData, required this.onTap, this.height, this.width});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: widget.onTap,
      onHover: (value) {
        isHover = value;
        setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: widget.height ?? 32.0,
        width: widget.width ?? 160.0,
        decoration: BoxDecoration(
            color: isHover ? const Color(0xFF9971FF) : const Color(0xFF7637EC),
            borderRadius: BorderRadius.circular(5.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.title, style: const TextStyle(color: Colors.white)),
            Icon(widget.iconData, color: Colors.white, size: 21.0)
          ],
        ),
      ),
    );
  }
}
