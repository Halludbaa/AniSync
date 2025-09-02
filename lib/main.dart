import 'package:anisync_flutter/bindings/root_binding.dart';
import 'package:anisync_flutter/firebase_options.dart';
import 'package:anisync_flutter/routes/app_route.dart';
import 'package:anisync_flutter/routes/app_route_named.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Get.put<AuthController>(AuthController(), tag: 'auth', permanent: true);

  runApp(AniSyncApp());
}

class AniSyncApp extends StatelessWidget {
  const AniSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Anisync",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteNamed.splash,
      initialBinding: RootBinding(),
      getPages: AppRoute.routes,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xffFEC220),
        colorScheme: ColorScheme.light(primary: Color(0xffFEC220)),
      ),
    );
  }
}
