import 'package:flutter/material.dart';

imageAnimation(PageController animation, images, active, void Function()? onTap,
    {double? width, double? height}) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      double margin = active ? 0 : 20;
      return InkWell(
        onTap: onTap,
        child: /*kIsWeb
            ? AnimatedContainer(
                width: width,
                height: height,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
                margin: EdgeInsets.all(margin),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Image border
                  child: WebImage(
                    // isSlider: true,
                    fit: BoxFit.contain,
                    url: images.toString(),
                    width: width != 0.0 ? width : null,
                    height: height != 0.0 ? height : null,
                  ),
                ),
              )

            :*/
            AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
                margin: EdgeInsets.all(margin),
                // width: MediaQuery.of(context).size.width,
                // height: (MediaQuery.of(context).size.width*0.4) - 20,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      images.toString(),
                    ),
                  ),
                ),
                child: widget),
      );
    },
  );
}
