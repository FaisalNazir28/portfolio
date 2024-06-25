import 'package:flutter/material.dart';

class CustomAppButton extends StatefulWidget {
  final Function() onTap;
  final String text;
  final bool blackButton;
  final bool greyButton;
  final bool hasRightMargin;
  final bool shrinkPadding;

  const CustomAppButton({
    required this.onTap,
    required this.text,
    this.blackButton = false,
    this.greyButton = false,
    this.hasRightMargin = false,
    this.shrinkPadding = false,
    super.key,
  });

  @override
  State<CustomAppButton> createState() => _CustomAppButtonState();
}

class _CustomAppButtonState extends State<CustomAppButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Container(
        margin: widget.hasRightMargin ? const EdgeInsets.only(right: 20) : null,
        padding: widget.shrinkPadding
            ? const EdgeInsets.symmetric(horizontal: 18, vertical: 10)
            : const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
        decoration: BoxDecoration(
          color: widget.blackButton
              ? Colors.black
              : widget.greyButton
                  ? const Color(0xfff5f5f0)
                  : Colors.white,
          borderRadius: BorderRadius.circular(widget.shrinkPadding ? 8 : 12),
          border: widget.blackButton
              ? null
              : Border.all(
                  color: Colors.black26,
                ),
        ),
        child: Text(
          widget.text,
          style: widget.shrinkPadding
              ? TextStyle(
                  color: widget.blackButton ? Colors.white : Colors.black)
              : TextStyle(
                  fontSize: 16,
                  color: widget.blackButton ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
