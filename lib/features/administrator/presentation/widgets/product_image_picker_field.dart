import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';

/// Widget que muestra el selector de imagen del producto con previsualizacion.
class ProductImagePickerField extends StatelessWidget {
  const ProductImagePickerField({
    super.key,
    required this.imageUrl,
    required this.isUploading,
    required this.onTap,
  });

  final String? imageUrl;
  final bool isUploading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isUploading ? null : onTap,
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: AppColors.primaryLight.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: imageUrl == null
                ? AppColors.primaryLight
                : AppColors.primary,
            width: 1.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (imageUrl != null)
                Image.network(
                  imageUrl!,
                  fit: BoxFit.fitHeight,
                  webHtmlElementStrategy: kIsWeb
                      ? WebHtmlElementStrategy.prefer
                      : WebHtmlElementStrategy.never,
                  errorBuilder: (_, __, ___) => _placeholder(),
                )
              else
                _placeholder(),
              if (isUploading)
                Container(
                  color: Colors.black.withValues(alpha: 0.45),
                  child: const Center(
                    child: CircularProgressIndicator(color: AppColors.white),
                  ),
                )
              else
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.55),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.photo_library_outlined,
                          color: AppColors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          imageUrl == null
                              ? 'Seleccionar imagen'
                              : 'Cambiar imagen',
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_photo_alternate_outlined,
          size: 48,
          color: AppColors.primary.withValues(alpha: 0.6),
        ),
        const SizedBox(height: 8),
        Text(
          'Toca para seleccionar una imagen',
          style: TextStyle(
            color: AppColors.primary.withValues(alpha: 0.7),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
