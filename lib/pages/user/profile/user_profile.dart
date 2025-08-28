import 'package:anisync_flutter/pages/home/home.dart';
import 'package:anisync_flutter/routes/app_route_named.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

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
              _heading1("Halludba"),
              _paragraph("Coffee addict, Tech Enthusiast and Otaku?"),
              _favorites(),
            ],
          ),
        ),
      ),
    );
  }

  Container _favorites() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: double.infinity,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_heading2("Favorites")],
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
      actions: [Icon(Icons.more_vert, color: Colors.white, size: 30)],
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
