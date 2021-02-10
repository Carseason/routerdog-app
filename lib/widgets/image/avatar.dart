import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatefulWidget {
  final String imageUrl;
  final BorderRadiusGeometry borderRadius;
  AvatarWidget({
    Key key,
    this.imageUrl,
    this.borderRadius,
  }) : super(key: key);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return new CachedNetworkImage(
      imageUrl: widget.imageUrl,
      alignment: Alignment.bottomRight,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius ?? null,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      //  placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) {
        return Image.asset("assets/image/avatar.png");
      },
    );
  }
}
