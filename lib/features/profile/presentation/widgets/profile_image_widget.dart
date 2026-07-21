import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';
import 'package:flutter_prototype/features/profile/presentation/state/profile_state.dart';

/// Widget que muestra la imagen de perfil con indicador de carga
class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.state,
    required this.defaultAsset,
  });

  final ProfileState state;
  final String defaultAsset;

  @override
  Widget build(BuildContext context) {
    final isProcessing = state.maybeWhen(
      loading: () => true,
      uploading: (_) => true,
      orElse: () => false,
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary, width: 3),
          ),
          child: ClipOval(child: _getImageWidget()),
        ),
        // Indicador de carga sobre la imagen
        if (isProcessing)
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withValues(alpha: 0.4),
            ),
            child: const Center(
              child: CircularProgressIndicator(color: AppColors.white),
            ),
          ),
      ],
    );
  }

  /// Retorna el widget de imagen según el estado actual
  Widget _getImageWidget() {
    return state.maybeWhen(
      loaded: (imageUrl) => _buildImage(imageUrl),
      uploading: (imageUrl) => _buildImage(imageUrl),
      orElse: () => Image.asset(
        defaultAsset,
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  /// Construye la imagen desde URL o asset por defecto
  Widget _buildImage(String? imageUrl) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        width: 150,
        height: 150,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          defaultAsset,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    }
    return Image.asset(
      defaultAsset,
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    );
  }
}
