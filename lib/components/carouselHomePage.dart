import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_buildwithdaffa/staticData/kontenCarousel.dart';
import '../style/colors.dart';
import '../style/textStyle.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

class CarouselHomePage extends StatefulWidget {
  const CarouselHomePage({super.key});

  @override
  State<CarouselHomePage> createState() => _CarouselHomePageState();
}

class _CarouselHomePageState extends State<CarouselHomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: KontenCarouselList.map((konten) {
          return Builder(
            builder: (BuildContext context) {
              return CardCarousel(
                  gambar: konten.gambar,
                  judul: konten.judul,
                  deskripsi: konten.deskripsi);
            },
          );
        }).toList(),
        carouselController: _controller,
        options: CarouselOptions(
            height: 180,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 6),
            autoPlayAnimationDuration: Duration(milliseconds: 400),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.5,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      SizedBox(
        height: 14,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: KontenCarouselList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : primary)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

class CardCarousel extends StatelessWidget {
  const CardCarousel({super.key, this.gambar, this.judul, this.deskripsi});
  final gambar;
  final judul;
  final deskripsi;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image:
                DecorationImage(image: AssetImage(gambar), fit: BoxFit.cover)),
      ),
      Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(20, 58, 81, 0.3),
                  Color.fromRGBO(20, 58, 91, 0.9)
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              judul,
              style: paragraph1.copyWith(color: text2),
            ),
            SizedBox(
              width: 280,
              child: Text(
                deskripsi,
                style: paragraph4.copyWith(color: text4),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      )
    ]);
  }
}
