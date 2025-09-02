import 'package:anisync_flutter/controllers/anime_controller.dart';
import 'package:anisync_flutter/controllers/auth_controller.dart';
import 'package:anisync_flutter/models/anime_model.dart';
import 'package:anisync_flutter/pages/home/home.dart';
import 'package:anisync_flutter/routes/app_route_named.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});
  final AuthController controller = Get.find<AuthController>(tag: 'auth');
  final AnimeController animeController = Get.find<AnimeController>(
    tag: 'main',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _profileAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _userPhoto(),
              SizedBox(height: 20),
              _heading1("${controller.currentUser.value?.fullname}"),
              _paragraph("${controller.currentUser.value?.bio}"),
              _favorites(controller.currentUser.value?.favorites ?? []),
            ],
          ),
        ),
      ),
    );
  }

  Container _favorites(List<AnimeModel> animes) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: double.infinity,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_heading2("Favorites"), animeCardHorizontal(animes)],
      ),
    );
  }

  ReadMoreText _paragraph(String text) {
    return ReadMoreText(
      text,
      trimLines: 5,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
      colorClickableText: Colors.blue,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read more',
      trimExpandedText: 'Show less',
      moreStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      lessStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Text _heading2(String text, {bool isSubtitle = false}) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontWeight: !isSubtitle ? FontWeight.w900 : FontWeight.w300,
        fontSize: 24,
      ),
    );
  }

  Text _heading1(String text, {bool isSubtitle = false}) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontWeight: !isSubtitle ? FontWeight.w900 : FontWeight.w300,
        fontSize: 32,
      ),
    );
  }

  ClipOval _userPhoto() {
    return ClipOval(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(color: Colors.grey[900]),
        child: Icon(Icons.person, size: 130, color: Colors.white),
      ),
    );
  }

  AppBar _profileAppBar(BuildContext context) {
    return AppBar(
      actions: [
        PopupMenuButton(
          icon: Icon(Icons.more_vert, color: Colors.white, size: 30),
          onSelected: (value) {
            switch (value) {
              case 'edit':
                print("edit");
              case 'logout':
                controller.logout();
            }
          },
          itemBuilder:
              (context) => [
                PopupMenuItem(
                  value: 'edit',
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text("Edit Profile"),
                  ),
                ),
                PopupMenuItem(
                  value: 'logout',
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                  ),
                ),
              ],
        ),
      ],
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
          size: 25,
        ),
      ),
      title: Image.asset("assets/images/app_logo_white.png", width: 70),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  GestureDetector animeCard({required String title, required String image}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouteNamed.animeDetail);
      },
      child: Stack(
        children: [
          Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            width: 200,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
