import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shoppixa/utils/custom_slider/custom_slider.dart';

List<String> imageList = [
  "https://www.bigbasket.com/media/uploads/banner_images/hp_bcd_m_bcd_250923_400.jpg?tr=w-1920,q=80",
  "https://www.bigbasket.com/media/uploads/banner_images/hp_m_babycare_250923_400.jpg?tr=w-1920,q=80",
  "https://www.bigbasket.com/media/uploads/banner_images/hp_m_health_suppliment_250923_400.jpg?tr=w-1920,q=80"
];

class TopPromoSlider extends StatelessWidget {
  const TopPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        height: 150.0,
        width: MediaQuery.sizeOf(context).width,
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
            aspectRatio: 0.1,
            initialPage: 0,
            enableInfiniteScroll: true,
            // autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

class PromoImageSlider extends StatelessWidget {
  const PromoImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: CustomImageSlider(
        images: imageList,
        height: MediaQuery.of(context).size.height * 0.17,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
