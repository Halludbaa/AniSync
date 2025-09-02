import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isShow;
  const CustomTextField({
    super.key,
    this.isShow = true,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var borderStyle = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffE09E14)),
      borderRadius: BorderRadius.circular(10),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextFormField(
        obscureText: !isShow,
        controller: controller,
        decoration: InputDecoration(
          // isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          enabledBorder: borderStyle,
          focusedBorder: borderStyle,
          label: Text(
            label,
            style: TextStyle(fontSize: 16, color: Color(0xffE09E14)),
          ),
        ),
      ),
    );
  }
}
