import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';
import 'package:flutter_prototype/features/administrator/presentation/state/products_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductColorsPickerField extends ConsumerWidget {
  const ProductColorsPickerField({
    super.key,
    required this.selectedColors,
    required this.onChanged,
    required this.maxColors,
    this.errorText,
  });

  final List<String> selectedColors;
  final ValueChanged<List<String>> onChanged;
  final int maxColors;
  final String? errorText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsProvider);
    final isDisabled = productsState.isSaving;

    return InputDecorator(
      isEmpty: selectedColors.isEmpty,
      decoration: InputDecoration(
        labelText: 'Colores',
        prefixIcon: const Icon(Icons.palette_outlined),
        errorText: errorText,
        enabled: !isDisabled,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedColors.isNotEmpty)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: selectedColors
                  .map(
                    (hex) => Chip(
                      avatar: CircleAvatar(backgroundColor: _hexToColor(hex)),
                      label: Text(hex),
                      onDeleted: isDisabled ? null : () => _removeColor(hex),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                  )
                  .toList(),
            )
          else
            Text(
              'No hay colores seleccionados',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: isDisabled || selectedColors.length >= maxColors
                  ? null
                  : () => _openColorPicker(context),
              icon: const Icon(Icons.add),
              label: Text(
                selectedColors.length >= maxColors
                    ? 'Maximo $maxColors colores'
                    : 'Agregar color',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _removeColor(String hex) {
    final next = List<String>.from(selectedColors)..remove(hex);
    onChanged(next);
  }

  Future<void> _openColorPicker(BuildContext context) async {
    Color tempColor = const Color(0xFF007AFF);

    final picked = await showDialog<Color>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Selecciona un color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: tempColor,
              enableAlpha: true,
              labelTypes: const [ColorLabelType.hex],
              onColorChanged: (value) {
                tempColor = value;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(tempColor),
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );

    if (picked == null) {
      return;
    }

    final hex = _toHexArgb(picked);
    if (selectedColors.contains(hex)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ese color ya fue agregado.')),
      );
      return;
    }

    onChanged([...selectedColors, hex]);
  }

  String _toHexArgb(Color color) {
    final value = color.toARGB32();
    return '#${value.toRadixString(16).toUpperCase().padLeft(8, '0')}';
  }

  Color _hexToColor(String hex) {
    final cleaned = hex.trim().toUpperCase().replaceAll('#', '');
    if (cleaned.length == 6) {
      return Color(int.parse('FF$cleaned', radix: 16));
    }
    if (cleaned.length == 8) {
      return Color(int.parse(cleaned, radix: 16));
    }
    return const Color(0xFF000000);
  }
}
