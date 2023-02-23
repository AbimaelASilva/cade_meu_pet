import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../padding/padding.dart';

class ProImageNetwork extends StatelessWidget {
  const ProImageNetwork({
    Key? key,
    this.heightImage,
    required this.widthImage,
    required this.imageUrl,
    required this.fit,
  }) : super(key: key);

  final double? heightImage;
  final double? widthImage;
  final String imageUrl;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: false, // Set it to false to prevent panning.
      boundaryMargin: ProPadding.all16,
      minScale: 0.5,
      maxScale: 4,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        width: widthImage,
        height: heightImage,
        errorWidget: (context, url, error) => Image.asset(
          'lib/app/ui/assets/images/error_image.png',
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
