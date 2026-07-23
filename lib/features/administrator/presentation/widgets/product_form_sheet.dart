import 'package:flutter/material.dart';
import 'package:flutter_prototype/core/theme/app_colors.dart';
import 'package:flutter_prototype/core/theme/app_text_styles.dart';
import 'package:flutter_prototype/features/administrator/presentation/constants/product_form_constants.dart';
import 'package:flutter_prototype/features/administrator/presentation/state/products_notifier.dart';
import 'package:flutter_prototype/features/administrator/presentation/widgets/product_colors_picker_field.dart';
import 'package:flutter_prototype/features/administrator/presentation/widgets/product_image_picker_field.dart';
import 'package:flutter_prototype/features/administrator/presentation/widgets/product_sizes_dropdown_field.dart';
import 'package:flutter_prototype/features/administrator/presentation/widgets/product_submit_button.dart';
import 'package:flutter_prototype/features/ecommerce/domain/entities/product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProductFormSheet extends ConsumerStatefulWidget {
  final ProductEntity? product;

  const ProductFormSheet({super.key, this.product});

  @override
  ConsumerState<ProductFormSheet> createState() => _ProductFormSheetState();
}

class _ProductFormSheetState extends ConsumerState<ProductFormSheet> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _priceController;

  late String _productId;
  late final List<String> _selectedSizes;
  late final List<String> _selectedColors;
  String? _uploadedImageUrl;
  bool _isUploadingImage = false;

  @override
  void initState() {
    super.initState();

    final product = widget.product;
    _nameController = TextEditingController(text: product?.name ?? '');
    _priceController = TextEditingController(
      text: product != null ? product.price.toStringAsFixed(2) : '',
    );
    _selectedSizes =
        product?.size
            .where((size) => productAvailableSizes.contains(size))
            .toList() ??
        <String>[];
    _selectedColors =
        product?.color.map(_normalizeHexColor).whereType<String>().toList() ??
        <String>[];

    if (product != null) {
      _productId = product.id;
      _uploadedImageUrl = product.imagePath.isNotEmpty
          ? product.imagePath
          : null;
    } else {
      _productId = ref.read(productsProvider.notifier).generateProductId();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
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
                ProductImagePickerField(
                  imageUrl: _uploadedImageUrl,
                  isUploading: _isUploadingImage,
                  onTap: _pickAndUploadImage,
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
                FormField<List<String>>(
                  initialValue: List<String>.from(_selectedSizes),
                  validator: (value) {
                    if ((value ?? <String>[]).isEmpty) {
                      return 'Selecciona al menos una talla.';
                    }
                    return null;
                  },
                  builder: (field) {
                    return ProductSizesDropdownField(
                      selectedSizes: _selectedSizes,
                      availableSizes: productAvailableSizes,
                      errorText: field.errorText,
                      onChanged: (sizes) {
                        setState(() {
                          _selectedSizes
                            ..clear()
                            ..addAll(sizes);
                        });
                        field.didChange(List<String>.from(_selectedSizes));
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                FormField<List<String>>(
                  initialValue: List<String>.from(_selectedColors),
                  validator: (value) {
                    if ((value ?? <String>[]).isEmpty) {
                      return 'Selecciona al menos un color.';
                    }
                    return null;
                  },
                  builder: (field) {
                    return ProductColorsPickerField(
                      selectedColors: _selectedColors,
                      maxColors: 4,
                      errorText: field.errorText,
                      onChanged: (colors) {
                        setState(() {
                          _selectedColors
                            ..clear()
                            ..addAll(colors);
                        });
                        field.didChange(List<String>.from(_selectedColors));
                      },
                    );
                  },
                ),
                const SizedBox(height: 24),
                ProductSubmitButton(
                  isSaving: state.isSaving,
                  isEditing: isEditing,
                  onPressed: _submit,
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

    if (_uploadedImageUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecciona una imagen para el producto.'),
        ),
      );
      return;
    }

    final saved = await ref
        .read(productsProvider.notifier)
        .saveProduct(
          id: _productId,
          name: _nameController.text.trim(),
          imagePath: _uploadedImageUrl!,
          price: double.parse(_priceController.text.trim()),
          size: _selectedSizes,
          color: _selectedColors,
        );

    if (saved && mounted) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _pickAndUploadImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );

    if (image == null) return;

    setState(() => _isUploadingImage = true);

    final url = await ref
        .read(productsProvider.notifier)
        .uploadProductImage(image, _productId);

    if (!mounted) return;

    if (url != null) {
      setState(() {
        _uploadedImageUrl = url;
        _isUploadingImage = false;
      });
    } else {
      setState(() => _isUploadingImage = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al subir la imagen. Intenta de nuevo.'),
        ),
      );
    }
  }

  String? _normalizeHexColor(String raw) {
    final cleaned = raw.trim().toUpperCase().replaceAll('#', '');
    if (cleaned.length == 6) {
      return '#FF$cleaned';
    }
    if (cleaned.length == 8) {
      return '#$cleaned';
    }
    return null;
  }
}
