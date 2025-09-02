import 'package:anisync_flutter/controllers/anime_controller.dart';
import 'package:anisync_flutter/controllers/auth_controller.dart';
import 'package:get/get.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), tag: 'auth', permanent: true);
    Get.put<AnimeController>(AnimeController(), tag: 'main', permanent: true);
  }
}
