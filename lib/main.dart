import 'package:anisync_flutter/pages/start/get_started.dart';
import 'package:anisync_flutter/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(AniSyncApp());
}

class AniSyncApp extends StatelessWidget {
  const AniSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Anisync",
      getPages: AppRoute.routes,
      home: GetStarted(),
    );
  }
}
