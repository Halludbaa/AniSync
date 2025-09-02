import 'package:anisync_flutter/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), tag: 'auth', permanent: true);
  }
}
