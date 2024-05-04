import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWithAutoScroll extends StatefulWidget {
  final List<String> images;

  const CarouselWithAutoScroll({Key? key, required this.images})
      : super(key: key);

  @override
  State<CarouselWithAutoScroll> createState() => _CarouselWithAutoScrollState();
}

class _CarouselWithAutoScrollState extends State<CarouselWithAutoScroll> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(

      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        viewportFraction: 0.8,
        
      ),
      items: widget.images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
