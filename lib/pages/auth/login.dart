import 'package:anisync_flutter/routes/app_route_named.dart';
import 'package:anisync_flutter/widgets/big_logo_text.dart';
import 'package:anisync_flutter/widgets/borderless_button.dart';
import 'package:anisync_flutter/widgets/custom_text_field.dart';
import 'package:anisync_flutter/widgets/custom_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigLogoText(text: CustomTitle(title: "Login")),
            CustomTextField(label: "Email", controller: _emailController),
            CustomTextField(
              label: "Password",
              controller: _passwordController,
              isShow: false,
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BorderlessButton(text: "Sign In", onPressed: () {}),
                Text("Forgot Password?"),
              ],
            ),
            SizedBox(height: 60),
            _signupText(),
          ],
        ),
      ),
    );
  }

  RichText _signupText() {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 14, color: Colors.black),
        children: [
          TextSpan(text: "You don't have account?"),
          TextSpan(
            text: " sign up",
            style: TextStyle(color: Color(0xff52AFCF)),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(AppRouteNamed.register);
                  },
          ),
        ],
      ),
    );
  }
}
