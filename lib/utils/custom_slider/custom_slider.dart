import 'package:flutter/material.dart';

import '../logger.dart';
import 'image_animation.dart';

class CustomImageSlider extends StatefulWidget {
  final List<String> images;

  double width;
  double height;

  CustomImageSlider(
      {Key? key,
      required this.images,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  State<CustomImageSlider> createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  late PageController _pageController;

  int activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: PageView.builder(
              itemCount: widget.images.length,
              physics: const BouncingScrollPhysics(),
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return imageAnimation(
                    width: widget.width,
                    height: widget.height,
                    _pageController,
                    widget.images[pagePosition].toString(),
                    active, () {
                  AppLog.i('pagePosition $pagePosition');

                  ///Deep-linkning

                  // RedirectEngine().redirectRoutes(
                  //     redirectUrl:
                  //         Uri.parse(widget.images[pagePosition].actionUrl),
                  //     delay: Duration.zero,
                  //     initial_app_open: true);

                  // WebEngageEvents().bannerClickEvent(map: {
                  //   "bannerName":
                  //       "${widget.images[pagePosition].actionName ?? ""}",
                  //   "category":
                  //       "${widget.images[pagePosition].actionItemCategories ?? ""}"
                  // });
                });
              }),
        ),
        if (widget.images.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              widget.images.length,
              (index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                      color:
                          activePage == index ? Colors.black : Colors.black26,
                      shape: BoxShape.circle),
                );
              },
            ),
            // children: indicators(widget.images.length, activePage),
          )
      ],
    );
  }
}
