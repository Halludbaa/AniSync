import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class AnimeDetail extends StatelessWidget {
  const AnimeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _detailAnimeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _animePoster(context),
            SizedBox(height: 280),
            _heading1("Takopii no Genzai"),
            _heading1("Takopi's Original Sin", isSubtitle: true),
            _animeShortDetail(),
            _synopsis(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),

              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _heading2("Information"),
                  _heading6("Genres: "),
                  _heading6("Themes: "),
                  _heading6("Studios: "),
                  _heading6("Demographics: "),
                  _heading6("Rating: "),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _heading6(String text) => Text(text, style: TextStyle(fontSize: 18));

  Container _synopsis() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: double.infinity,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading2("Synopsis"),
          _paragraph(
            "A squid-like creature, known as a Happian, leaves his home planet with  the desire to spread happiness across the universe. He lands on Earth,  but quickly finds himself in danger of captivity by its inhabitants.  Fortunately, he is found by an unsmiling little girl named Shizuka Kuze, who feeds him and names him Takopii. Feeling indebted, Takopii decides  to do everything in his power to bring a smile to her face. ",
          ),
        ],
      ),
    );
  }

  ReadMoreText _paragraph(String text) {
    return ReadMoreText(
      text,
      trimLines: 5,
      style: TextStyle(fontSize: 16),
      colorClickableText: Colors.blue,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read more',
      trimExpandedText: 'Show less',
      moreStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      lessStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Container _animeShortDetail() {
    return Container(
      color: Colors.grey[100],
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _animeScore(),
          _heading5("Finished Airing, ONA 2025"),
          _heading5("6 eps"),
        ],
      ),
    );
  }

  Row _animeScore() {
    return Row(
      spacing: 5,
      children: [Icon(Icons.star_border, size: 30), _heading5("8.88")],
    );
  }

  Text _heading5(String text) => Text(text, style: TextStyle(fontSize: 18));

  Text _heading1(String text, {bool isSubtitle = false}) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontWeight: !isSubtitle ? FontWeight.w900 : FontWeight.w300,
        fontSize: 28,
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

  Stack _animePoster(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
        ),
        Positioned(
          bottom: -270,
          child: Container(
            width: 250,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  "https://cdn.myanimelist.net/images/anime/1182/149879.jpg",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }

  AppBar _detailAnimeAppBar() {
    return AppBar(
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
      actionsPadding: EdgeInsets.only(right: 10),
      actions: [
        Icon(Icons.favorite_border, color: Colors.white, size: 25),
        SizedBox(width: 10),
        Icon(Icons.share_outlined, color: Colors.white, size: 25),
      ],
      title: Image.asset("assets/images/app_logo_white.png", width: 70),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
