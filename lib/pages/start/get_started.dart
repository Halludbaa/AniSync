import 'package:anisync_flutter/routes/app_route_named.dart';
import 'package:anisync_flutter/widgets/big_logo_text.dart';
import 'package:anisync_flutter/widgets/bordered_button.dart';
import 'package:anisync_flutter/widgets/borderless_button.dart';
import 'package:anisync_flutter/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigLogoText(
              text: CustomTitle(
                title: "Get Started",
                subtitle: "Check New Update About Anime",
              ),
            ),
            SizedBox(height: 150),
            Column(
              spacing: 16,
              children: [
                BorderlessButton(
                  text: "Sign In",
                  onPressed: () {
                    Get.toNamed(AppRouteNamed.login);
                  },
                ),
                BorderedButton(
                  text: "Sign Up",
                  onPressed: () {
                    Get.toNamed(AppRouteNamed.register);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
