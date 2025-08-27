import 'package:anisync_flutter/pages/home/home.dart';
import 'package:anisync_flutter/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const AniSyncApp());
}

class AniSyncApp extends StatelessWidget {
  const AniSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoute.routes,
      title: "AniSync",
      home: Home(),
    );
  }
}
