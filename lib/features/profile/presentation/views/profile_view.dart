import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';
import 'package:flutter_prototype/features/profile/presentation/state/profile_notifier.dart';
import 'package:flutter_prototype/features/profile/presentation/widgets/profile_change_image_button.dart';
import 'package:flutter_prototype/features/profile/presentation/widgets/profile_image_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Vista de administración del perfil del usuario
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  static const String _defaultProfileAsset = 'assets/images/default_profile.jpg';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Mi Perfil',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagen de perfil con indicador de carga
                ProfileImageWidget(
                  state: state,
                  defaultAsset: _defaultProfileAsset,
                ),
                const SizedBox(height: 24),
                // Botón para cambiar imagen
                ProfileChangeImageButton(state: state),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
