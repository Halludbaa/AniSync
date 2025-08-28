import 'package:anisync_flutter/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class BigLogoText extends StatelessWidget {
  final CustomTitle text;
  const BigLogoText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/images/app_logo.png", width: 400),
        Positioned(bottom: 10, child: text),
      ],
    );
  }
}
