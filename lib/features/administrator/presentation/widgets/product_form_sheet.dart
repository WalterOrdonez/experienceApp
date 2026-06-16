import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';
import 'package:flutter_prototype/core/theme/app_text_styles.dart';
import 'package:flutter_prototype/features/administrator/presentation/state/products_notifier.dart';
import 'package:flutter_prototype/features/ecommerce/domain/entities/product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductFormSheet extends ConsumerStatefulWidget {
  final ProductEntity? product;

  const ProductFormSheet({super.key, this.product});

  @override
  ConsumerState<ProductFormSheet> createState() => _ProductFormSheetState();
}

class _ProductFormSheetState extends ConsumerState<ProductFormSheet> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _imagePathController;
  late final TextEditingController _priceController;
  late final TextEditingController _sizesController;
  late final TextEditingController _colorsController;

  @override
  void initState() {
    super.initState();

    final product = widget.product;
    _nameController = TextEditingController(text: product?.name ?? '');
    _imagePathController = TextEditingController(
      text: product?.imagePath ?? '',
    );
    _priceController = TextEditingController(
      text: product != null ? product.price.toStringAsFixed(2) : '',
    );
    _sizesController = TextEditingController(
      text: product?.size.join(', ') ?? '',
    );
    _colorsController = TextEditingController(
      text: product?.color.map(_formatColorValue).join(', ') ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _imagePathController.dispose();
    _priceController.dispose();
    _sizesController.dispose();
    _colorsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productsProvider);
    final isEditing = widget.product != null;

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isEditing ? 'Editar producto' : 'Nuevo producto',
                  style: AppTextStyles.heading.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Completa la información base del catálogo tal como se almacena.',
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    prefixIcon: Icon(Icons.inventory_2_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Ingresa el nombre del producto.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _imagePathController,
                  decoration: const InputDecoration(
                    labelText: 'Ruta de imagen o URL',
                    prefixIcon: Icon(Icons.image_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Ingresa una ruta de imagen o URL.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _priceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Precio',
                    prefixIcon: Icon(Icons.attach_money_rounded),
                  ),
                  validator: (value) {
                    final parsed = double.tryParse((value ?? '').trim());
                    if (parsed == null || parsed <= 0) {
                      return 'Ingresa un precio válido.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _sizesController,
                  decoration: const InputDecoration(
                    labelText: 'Tallas separadas por coma',
                    prefixIcon: Icon(Icons.straighten_rounded),
                  ),
                  validator: (value) {
                    if (_parseSizes(value).isEmpty) {
                      return 'Ingresa al menos una talla.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _colorsController,
                  decoration: const InputDecoration(
                    labelText: 'Colores hex o enteros separados por coma',
                    prefixIcon: Icon(Icons.palette_outlined),
                  ),
                  validator: (value) {
                    if (_tryParseColors(value) == null) {
                      return 'Usa valores como 0xFF000000, FF007AFF o 4278190080.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state.isSaving ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      disabledBackgroundColor: AppColors.primaryLight,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: state.isSaving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.white,
                              ),
                            ),
                          )
                        : Text(
                            isEditing ? 'Guardar cambios' : 'Crear producto',
                            style: AppTextStyles.button,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final colors = _tryParseColors(_colorsController.text);
    if (colors == null) {
      return;
    }

    final saved = await ref
        .read(productsProvider.notifier)
        .saveProduct(
          id: widget.product?.id,
          name: _nameController.text.trim(),
          imagePath: _imagePathController.text.trim(),
          price: double.parse(_priceController.text.trim()),
          size: _parseSizes(_sizesController.text),
          color: colors,
        );

    if (saved && mounted) {
      Navigator.of(context).pop();
    }
  }

  List<String> _parseSizes(String? value) {
    return (value ?? '')
        .split(',')
        .map((item) => item.trim())
        .where((item) => item.isNotEmpty)
        .toList();
  }

  List<int>? _tryParseColors(String? value) {
    final rawValues = (value ?? '')
        .split(',')
        .map((item) => item.trim())
        .where((item) => item.isNotEmpty)
        .toList();

    if (rawValues.isEmpty) {
      return null;
    }

    final parsed = <int>[];

    for (final rawValue in rawValues) {
      final normalized = rawValue.toUpperCase().replaceAll('#', '');
      final parsedValue =
          int.tryParse(normalized) ??
          int.tryParse(normalized.replaceFirst('0X', ''), radix: 16) ??
          int.tryParse(normalized, radix: 16);

      if (parsedValue == null) {
        return null;
      }

      parsed.add(parsedValue);
    }

    return parsed;
  }

  String _formatColorValue(int value) {
    return '0x${value.toRadixString(16).toUpperCase()}';
  }
}
