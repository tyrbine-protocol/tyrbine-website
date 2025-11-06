import 'package:flutter/material.dart';

class HoverTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const HoverTextButton({super.key, required this.text, required this.onTap});

  @override
  HoverTextButtonState createState() => HoverTextButtonState();
}

class HoverTextButtonState extends State<HoverTextButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),
          style: TextStyle(
            fontSize: 12.0,
            color: _isHovered ? Colors.white : Colors.grey.shade800,
            fontFamily: 'Roobert'
          ),
          child: Text(widget.text,
        ),
      )),
    );
  }
}
