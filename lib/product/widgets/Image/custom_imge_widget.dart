import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({super.key, required this.imageUrl, this.fit, this.height, this.width});

  final String imageUrl;
  final BoxFit? fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) => const Center(child: CircularProgressIndicator.adaptive()),
      errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
    );
  }

  CachedNetworkImageProvider get imageProvider => CachedNetworkImageProvider(imageUrl);
}
