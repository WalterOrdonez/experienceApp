// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OnboardingState {
  int get currentImageIndex => throw _privateConstructorUsedError;
  List<OnboardingImageEntity> get images => throw _privateConstructorUsedError;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
    OnboardingState value,
    $Res Function(OnboardingState) then,
  ) = _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call({int currentImageIndex, List<OnboardingImageEntity> images});
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentImageIndex = null, Object? images = null}) {
    return _then(
      _value.copyWith(
            currentImageIndex: null == currentImageIndex
                ? _value.currentImageIndex
                : currentImageIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<OnboardingImageEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OnboardingStateImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$OnboardingStateImplCopyWith(
    _$OnboardingStateImpl value,
    $Res Function(_$OnboardingStateImpl) then,
  ) = __$$OnboardingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentImageIndex, List<OnboardingImageEntity> images});
}

/// @nodoc
class __$$OnboardingStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingStateImpl>
    implements _$$OnboardingStateImplCopyWith<$Res> {
  __$$OnboardingStateImplCopyWithImpl(
    _$OnboardingStateImpl _value,
    $Res Function(_$OnboardingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentImageIndex = null, Object? images = null}) {
    return _then(
      _$OnboardingStateImpl(
        currentImageIndex: null == currentImageIndex
            ? _value.currentImageIndex
            : currentImageIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<OnboardingImageEntity>,
      ),
    );
  }
}

/// @nodoc

class _$OnboardingStateImpl implements _OnboardingState {
  const _$OnboardingStateImpl({
    this.currentImageIndex = 0,
    final List<OnboardingImageEntity> images = const [],
  }) : _images = images;

  @override
  @JsonKey()
  final int currentImageIndex;
  final List<OnboardingImageEntity> _images;
  @override
  @JsonKey()
  List<OnboardingImageEntity> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'OnboardingState(currentImageIndex: $currentImageIndex, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStateImpl &&
            (identical(other.currentImageIndex, currentImageIndex) ||
                other.currentImageIndex == currentImageIndex) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentImageIndex,
    const DeepCollectionEquality().hash(_images),
  );

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      __$$OnboardingStateImplCopyWithImpl<_$OnboardingStateImpl>(
        this,
        _$identity,
      );
}

abstract class _OnboardingState implements OnboardingState {
  const factory _OnboardingState({
    final int currentImageIndex,
    final List<OnboardingImageEntity> images,
  }) = _$OnboardingStateImpl;

  @override
  int get currentImageIndex;
  @override
  List<OnboardingImageEntity> get images;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
