import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';
import 'package:flutter_prototype/core/theme/app_text_styles.dart';
import 'package:flutter_prototype/features/administrator/presentation/state/products_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductSizesDropdownField extends ConsumerWidget {
  const ProductSizesDropdownField({
    super.key,
    required this.selectedSizes,
    required this.availableSizes,
    required this.onChanged,
    this.errorText,
  });

  final List<String> selectedSizes;
  final List<String> availableSizes;
  final ValueChanged<List<String>> onChanged;
  final String? errorText;

  void _toggleSize(String size) {
    final next = List<String>.from(selectedSizes);
    if (next.contains(size)) {
      next.remove(size);
    } else {
      next.add(size);
    }
    onChanged(next);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsProvider);
    final isDisabled = productsState.isSaving;
    final hasSelection = selectedSizes.isNotEmpty;

    return MenuAnchor(
      menuChildren: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 340),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final size in availableSizes)
                  CheckboxListTile(
                    dense: true,
                    value: selectedSizes.contains(size),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(size),
                    onChanged: isDisabled ? null : (_) => _toggleSize(size),
                  ),
              ],
            ),
          ),
        ),
      ],
      builder: (context, controller, child) {
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: isDisabled
              ? null
              : () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
          child: InputDecorator(
            isEmpty: !hasSelection,
            decoration: InputDecoration(
              labelText: 'Tallas',
              prefixIcon: const Icon(Icons.straighten_rounded),
              suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
              errorText: errorText,
              enabled: !isDisabled,
            ),
            child: hasSelection
                ? Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: selectedSizes
                        .map(
                          (size) => Chip(
                            label: Text(size),
                            deleteIcon: const Icon(Icons.close, size: 16),
                            onDeleted: isDisabled
                                ? null
                                : () => _toggleSize(size),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                        )
                        .toList(),
                  )
                : Text(
                    'Selecciona una o más tallas',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
