import 'package:anisync_flutter/routes/app_route_named.dart';
import 'package:anisync_flutter/widgets/big_logo_text.dart';
import 'package:anisync_flutter/widgets/borderless_button.dart';
import 'package:anisync_flutter/widgets/custom_text_field.dart';
import 'package:anisync_flutter/widgets/custom_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigLogoText(text: CustomTitle(title: "Register")),
            CustomTextField(label: "Email", controller: _emailController),
            CustomTextField(
              label: "Password",
              controller: _passwordController,
              isShow: false,
            ),
            CustomTextField(
              label: "Confirm Password",
              controller: _passwordCoController,
              isShow: false,
            ),
            SizedBox(height: 30),
            BorderlessButton(text: "Sign In", onPressed: () {}),
            SizedBox(height: 40),
            _signinText(),
          ],
        ),
      ),
    );
  }

  RichText _signinText() {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 14, color: Colors.black),
        children: [
          TextSpan(text: "Already have account?"),
          TextSpan(
            text: " sign in",
            style: TextStyle(color: Color(0xff52AFCF)),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(AppRouteNamed.login);
                  },
          ),
        ],
      ),
    );
  }
}
