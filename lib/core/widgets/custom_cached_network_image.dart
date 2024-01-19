import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomCashedNetworkImage extends StatelessWidget {
  const CustomCashedNetworkImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.black,
      ),
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
            value: progress.progress, color: kPrimaryColor),
      ),
      imageUrl: imageUrl,
      height: 40.0,
      width: 40.0,
    );
  }
}
