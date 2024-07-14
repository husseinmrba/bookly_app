import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final String imageUrl;
  const CustomBookImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    bool isValidUrl = Uri.tryParse(imageUrl)?.hasAbsolutePath ?? false;
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4, // width to height
        child: isValidUrl
            ? CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: imageUrl,
                errorWidget: (context, url, error) {
                  return const Icon(Icons.error);
                },
              )
            : const Icon(Icons.error),
      ),
    );
  }
}
