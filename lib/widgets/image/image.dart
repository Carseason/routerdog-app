import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/*
    图片组件
*/
class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final BorderRadiusGeometry borderRadius;
  const ImageWidget({
    Key key,
    this.imageUrl,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CachedNetworkImage(
      imageUrl: this.imageUrl,
      placeholder: (context, url) {
        return Image.asset(
          "assets/image/lazyload.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        );
      },
      errorWidget: (ontext, url, error) {
        return Image.asset(
          "assets/image/lazyload.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        );
      },
      alignment: Alignment.bottomRight,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: this.borderRadius ?? null,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ImagesWidget extends StatelessWidget {
  final String imageUrl;
  const ImagesWidget({
    Key key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(image: CachedNetworkImageProvider(this.imageUrl));
  }
}

Images(String imageUrl) {
  return CachedNetworkImageProvider(imageUrl);
}
