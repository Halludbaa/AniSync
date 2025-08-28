import 'package:flutter/material.dart';

class BorderlessButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const BorderlessButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(350, 50),
        elevation: 0,
        backgroundColor: Color(0XFFFEC220),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
