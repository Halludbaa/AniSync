import 'package:anisync_flutter/controllers/auth_controller.dart';
import 'package:anisync_flutter/routes/app_route_named.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      final authController = Get.find<AuthController>(tag: 'auth');

      if (authController.isSignedIn.value) {
        return Get.offAllNamed(AppRouteNamed.home);
      }

      return Get.offAllNamed(AppRouteNamed.getStarted);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appLogo(),
            CircularProgressIndicator(),
            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }

  Stack appLogo() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/images/app_logo.png"),
        Positioned(
          bottom: 20,
          child: Text(
            "AniSync",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
