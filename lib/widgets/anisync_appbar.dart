import 'package:anisync_flutter/routes/app_route_named.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnisyncAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnisyncAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 0,
      titleSpacing: 0,
      title: _titleAppBar(),
      actions: _appActions,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  List<Widget> get _appActions {
    return [
      IconButton(
        onPressed: () {},
        iconSize: 30,
        color: Colors.white,
        icon: Icon(Icons.search),
      ),
      IconButton(
        onPressed: () {
          Get.toNamed(AppRouteNamed.profile);
        },
        iconSize: 30,
        color: Colors.white,
        icon: Icon(Icons.person),
      ),
    ];
  }

  Stack _titleAppBar() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Image.asset("assets/images/app_logo_white.png", width: 70),
        Positioned(
          right: -75,
          child: Text(
            "AniSync",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }
}
