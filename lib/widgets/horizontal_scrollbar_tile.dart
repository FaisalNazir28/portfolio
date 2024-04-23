import 'package:flutter/material.dart';

class HorizontalScrollBarTile extends StatefulWidget {
  final Icon? icon;
  final String count;
  final String text;

  const HorizontalScrollBarTile({
    super.key,
    this.icon,
    required this.count,
    required this.text,
  });

  @override
  State<HorizontalScrollBarTile> createState() =>
      _HorizontalScrollBarTileState();
}

class _HorizontalScrollBarTileState extends State<HorizontalScrollBarTile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: widget.icon ??
            Row(
              children: [
                Text(
                  "${widget.count}+",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    widget.text,
                    style: const TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
