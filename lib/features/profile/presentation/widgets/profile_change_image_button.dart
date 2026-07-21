import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';
import 'package:flutter_prototype/features/profile/presentation/state/profile_notifier.dart';
import 'package:flutter_prototype/features/profile/presentation/state/profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

/// Botón para cambiar la imagen de perfil con selector de galería
class ProfileChangeImageButton extends ConsumerWidget {
  const ProfileChangeImageButton({
    super.key,
    required this.state,
  });

  final ProfileState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = state.maybeWhen(
      loading: () => true,
      uploading: (_) => true,
      orElse: () => false,
    );

    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: isLoading ? null : () => _pickAndUploadImage(ref),
          icon: const Icon(Icons.camera_alt_outlined),
          label: const Text('Cambiar imagen de perfil'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Mensaje de error si existe
        state.maybeWhen(
          error: (message) => Text(
            message,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          orElse: () => const SizedBox.shrink(),
        ),
      ],
    );
  }

  /// Abre el selector de imágenes y sube la imagen seleccionada
  Future<void> _pickAndUploadImage(WidgetRef ref) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 80,
    );

    if (image != null) {
      ref.read(profileProvider.notifier).uploadProfileImage(image);
    }
  }
}
