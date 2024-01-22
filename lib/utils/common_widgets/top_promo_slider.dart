import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TopPromoSlider extends StatelessWidget {
  const TopPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        height: 150.0,
        width: double.infinity,
        child: CarouselSlider(
          items: [
            Image.network(
                'https://www.bigbasket.com/media/uploads/banner_images/hp_bcd_m_bcd_250923_400.jpg?tr=w-1920,q=80'),
            Image.network(
                "https://www.bigbasket.com/media/uploads/banner_images/hp_m_babycare_250923_400.jpg?tr=w-1920,q=80"),
            Image.network(
                'https://www.bigbasket.com/media/uploads/banner_images/hp_m_health_suppliment_250923_400.jpg?tr=w-1920,q=80'),
          ],
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.1,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
