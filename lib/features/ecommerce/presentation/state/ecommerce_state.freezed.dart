// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ecommerce_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$EcommerceState {
  int get currentBannerIndex => throw _privateConstructorUsedError;
  List<String> get bannerImages => throw _privateConstructorUsedError;
  List<ProductEntity> get newArrivals => throw _privateConstructorUsedError;
  int get selectedNavIndex => throw _privateConstructorUsedError;

  /// Create a copy of EcommerceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EcommerceStateCopyWith<EcommerceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EcommerceStateCopyWith<$Res> {
  factory $EcommerceStateCopyWith(
    EcommerceState value,
    $Res Function(EcommerceState) then,
  ) = _$EcommerceStateCopyWithImpl<$Res, EcommerceState>;
  @useResult
  $Res call({
    int currentBannerIndex,
    List<String> bannerImages,
    List<ProductEntity> newArrivals,
    int selectedNavIndex,
  });
}

/// @nodoc
class _$EcommerceStateCopyWithImpl<$Res, $Val extends EcommerceState>
    implements $EcommerceStateCopyWith<$Res> {
  _$EcommerceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EcommerceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBannerIndex = null,
    Object? bannerImages = null,
    Object? newArrivals = null,
    Object? selectedNavIndex = null,
  }) {
    return _then(
      _value.copyWith(
            currentBannerIndex: null == currentBannerIndex
                ? _value.currentBannerIndex
                : currentBannerIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            bannerImages: null == bannerImages
                ? _value.bannerImages
                : bannerImages // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            newArrivals: null == newArrivals
                ? _value.newArrivals
                : newArrivals // ignore: cast_nullable_to_non_nullable
                      as List<ProductEntity>,
            selectedNavIndex: null == selectedNavIndex
                ? _value.selectedNavIndex
                : selectedNavIndex // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EcommerceStateImplCopyWith<$Res>
    implements $EcommerceStateCopyWith<$Res> {
  factory _$$EcommerceStateImplCopyWith(
    _$EcommerceStateImpl value,
    $Res Function(_$EcommerceStateImpl) then,
  ) = __$$EcommerceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int currentBannerIndex,
    List<String> bannerImages,
    List<ProductEntity> newArrivals,
    int selectedNavIndex,
  });
}

/// @nodoc
class __$$EcommerceStateImplCopyWithImpl<$Res>
    extends _$EcommerceStateCopyWithImpl<$Res, _$EcommerceStateImpl>
    implements _$$EcommerceStateImplCopyWith<$Res> {
  __$$EcommerceStateImplCopyWithImpl(
    _$EcommerceStateImpl _value,
    $Res Function(_$EcommerceStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EcommerceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBannerIndex = null,
    Object? bannerImages = null,
    Object? newArrivals = null,
    Object? selectedNavIndex = null,
  }) {
    return _then(
      _$EcommerceStateImpl(
        currentBannerIndex: null == currentBannerIndex
            ? _value.currentBannerIndex
            : currentBannerIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        bannerImages: null == bannerImages
            ? _value._bannerImages
            : bannerImages // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        newArrivals: null == newArrivals
            ? _value._newArrivals
            : newArrivals // ignore: cast_nullable_to_non_nullable
                  as List<ProductEntity>,
        selectedNavIndex: null == selectedNavIndex
            ? _value.selectedNavIndex
            : selectedNavIndex // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$EcommerceStateImpl implements _EcommerceState {
  const _$EcommerceStateImpl({
    this.currentBannerIndex = 0,
    final List<String> bannerImages = const [],
    final List<ProductEntity> newArrivals = const [],
    this.selectedNavIndex = 0,
  }) : _bannerImages = bannerImages,
       _newArrivals = newArrivals;

  @override
  @JsonKey()
  final int currentBannerIndex;
  final List<String> _bannerImages;
  @override
  @JsonKey()
  List<String> get bannerImages {
    if (_bannerImages is EqualUnmodifiableListView) return _bannerImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bannerImages);
  }

  final List<ProductEntity> _newArrivals;
  @override
  @JsonKey()
  List<ProductEntity> get newArrivals {
    if (_newArrivals is EqualUnmodifiableListView) return _newArrivals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newArrivals);
  }

  @override
  @JsonKey()
  final int selectedNavIndex;

  @override
  String toString() {
    return 'EcommerceState(currentBannerIndex: $currentBannerIndex, bannerImages: $bannerImages, newArrivals: $newArrivals, selectedNavIndex: $selectedNavIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcommerceStateImpl &&
            (identical(other.currentBannerIndex, currentBannerIndex) ||
                other.currentBannerIndex == currentBannerIndex) &&
            const DeepCollectionEquality().equals(
              other._bannerImages,
              _bannerImages,
            ) &&
            const DeepCollectionEquality().equals(
              other._newArrivals,
              _newArrivals,
            ) &&
            (identical(other.selectedNavIndex, selectedNavIndex) ||
                other.selectedNavIndex == selectedNavIndex));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentBannerIndex,
    const DeepCollectionEquality().hash(_bannerImages),
    const DeepCollectionEquality().hash(_newArrivals),
    selectedNavIndex,
  );

  /// Create a copy of EcommerceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EcommerceStateImplCopyWith<_$EcommerceStateImpl> get copyWith =>
      __$$EcommerceStateImplCopyWithImpl<_$EcommerceStateImpl>(
        this,
        _$identity,
      );
}

abstract class _EcommerceState implements EcommerceState {
  const factory _EcommerceState({
    final int currentBannerIndex,
    final List<String> bannerImages,
    final List<ProductEntity> newArrivals,
    final int selectedNavIndex,
  }) = _$EcommerceStateImpl;

  @override
  int get currentBannerIndex;
  @override
  List<String> get bannerImages;
  @override
  List<ProductEntity> get newArrivals;
  @override
  int get selectedNavIndex;

  /// Create a copy of EcommerceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EcommerceStateImplCopyWith<_$EcommerceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
