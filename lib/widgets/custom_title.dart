import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomTitle({super.key, required this.title, this.subtitle = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 32,
          ),
        ),
        Text(subtitle, style: TextStyle(color: Colors.black45, fontSize: 16)),
      ],
    );
  }
}
