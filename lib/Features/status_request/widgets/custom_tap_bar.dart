import 'package:flutter/material.dart';

class CustomTapBar extends StatelessWidget {
  const CustomTapBar({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.grey, blurRadius: 5.0, offset: Offset(-2, 2))
          ],
          color: const Color(0xff7350cb),
          borderRadius: BorderRadius.circular(12)),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
