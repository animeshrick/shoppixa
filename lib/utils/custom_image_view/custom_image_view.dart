import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final String url;
  double height;
  double width;
  BoxFit? fit;

  CustomImageView(
      {Key? key,
      required this.url,
      this.width = 0.0,
      this.height = 0.0,
      BoxFit? fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: NetworkImage(
          "https://cdn.dribbble.com/users/844846/screenshots/2855815/media/1bf0a2eb21537488818c8ff5de1dd845.jpg?resize=800x600&vertical=center"),
      image: NetworkImage(url),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset(
          "assets/images/error_image.jpg",
          width: width != 0.0 ? width : null,
          height: height != 0.0 ? height : null,
          fit: BoxFit.contain,
        );
      },
      fit: fit ?? BoxFit.contain,
      width: width != 0.0 ? width : null,
      height: height != 0.0 ? height : null,
    );
  }
}
