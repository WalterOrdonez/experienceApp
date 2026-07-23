import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';

class ProductImagePreview extends StatelessWidget {
  final String imagePath;

  const ProductImagePreview({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final normalizedImagePath = imagePath.trim();
    final imageUri = Uri.tryParse(normalizedImagePath);
    final isNetworkImage =
        imageUri != null &&
        (imageUri.scheme == 'http' || imageUri.scheme == 'https');

    if (normalizedImagePath.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: 88,
          height: 88,
          color: AppColors.primaryLight,
          child: const _ImageFallback(),
        ),
      );
    }

    final image = isNetworkImage
        ? Image.network(
            normalizedImagePath,
            fit: BoxFit.cover,
            webHtmlElementStrategy: kIsWeb
                ? WebHtmlElementStrategy.prefer
                : WebHtmlElementStrategy.never,
            errorBuilder: (context, error, stackTrace) =>
                const _ImageFallback(),
          )
        : Image.asset(
            normalizedImagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const _ImageFallback(),
          );

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 88,
        height: 88,
        color: AppColors.primaryLight,
        child: image,
      ),
    );
  }
}

class _ImageFallback extends StatelessWidget {
  const _ImageFallback();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.image_not_supported_outlined,
        size: 28,
        color: AppColors.primary,
      ),
    );
  }
}
