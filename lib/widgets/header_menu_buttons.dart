import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const HeaderButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        overlayColor:
            WidgetStateProperty.all<Color>(Colors.black.withOpacity(0.05)),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      child: Text(title),
    );
  }
}
