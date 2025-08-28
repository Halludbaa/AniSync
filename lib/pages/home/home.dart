import 'package:anisync_flutter/routes/app_route_named.dart';
import 'package:anisync_flutter/widgets/anisync_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnisyncAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _heading1(text: "Seasonal Anime"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10,
                    children: [
                      animeCard(
                        image:
                            'https://cdn.myanimelist.net/images/anime/1024/150787.jpg',
                        title: "Sono Bisque Doll wa Koi wo Suru Season 2",
                      ),
                      animeCard(
                        image:
                            'https://cdn.myanimelist.net/images/anime/1682/150432.jpg',
                        title: "Gachiakuta",
                      ),
                    ],
                  ),
                ),
                _heading1(text: "Top Airing Anime"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10,
                    children: [
                      animeCard(
                        image:
                            'https://cdn.myanimelist.net/images/anime/1024/150787.jpg',
                        title: "Sono Bisque Doll wa Koi wo Suru Season 2",
                      ),
                      animeCard(
                        image:
                            'https://cdn.myanimelist.net/images/anime/1682/150432.jpg',
                        title: "Gachiakuta",
                      ),
                    ],
                  ),
                ),
                _heading1(text: "Upcoming Anime"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10,
                    children: [
                      animeCard(
                        image:
                            'https://cdn.myanimelist.net/images/anime/1024/150787.jpg',
                        title: "Sono Bisque Doll wa Koi wo Suru Season 2",
                      ),
                      animeCard(
                        image:
                            'https://cdn.myanimelist.net/images/anime/1682/150432.jpg',
                        title: "Gachiakuta",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _heading1({required String text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
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
