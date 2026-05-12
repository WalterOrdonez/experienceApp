// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_interests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OnboardingInterestsState {
  List<String> get availableInterests => throw _privateConstructorUsedError;
  Set<String> get selectedInterests => throw _privateConstructorUsedError;

  /// Create a copy of OnboardingInterestsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingInterestsStateCopyWith<OnboardingInterestsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingInterestsStateCopyWith<$Res> {
  factory $OnboardingInterestsStateCopyWith(
    OnboardingInterestsState value,
    $Res Function(OnboardingInterestsState) then,
  ) = _$OnboardingInterestsStateCopyWithImpl<$Res, OnboardingInterestsState>;
  @useResult
  $Res call({List<String> availableInterests, Set<String> selectedInterests});
}

/// @nodoc
class _$OnboardingInterestsStateCopyWithImpl<
  $Res,
  $Val extends OnboardingInterestsState
>
    implements $OnboardingInterestsStateCopyWith<$Res> {
  _$OnboardingInterestsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingInterestsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableInterests = null,
    Object? selectedInterests = null,
  }) {
    return _then(
      _value.copyWith(
            availableInterests: null == availableInterests
                ? _value.availableInterests
                : availableInterests // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            selectedInterests: null == selectedInterests
                ? _value.selectedInterests
                : selectedInterests // ignore: cast_nullable_to_non_nullable
                      as Set<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OnboardingInterestsStateImplCopyWith<$Res>
    implements $OnboardingInterestsStateCopyWith<$Res> {
  factory _$$OnboardingInterestsStateImplCopyWith(
    _$OnboardingInterestsStateImpl value,
    $Res Function(_$OnboardingInterestsStateImpl) then,
  ) = __$$OnboardingInterestsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> availableInterests, Set<String> selectedInterests});
}

/// @nodoc
class __$$OnboardingInterestsStateImplCopyWithImpl<$Res>
    extends
        _$OnboardingInterestsStateCopyWithImpl<
          $Res,
          _$OnboardingInterestsStateImpl
        >
    implements _$$OnboardingInterestsStateImplCopyWith<$Res> {
  __$$OnboardingInterestsStateImplCopyWithImpl(
    _$OnboardingInterestsStateImpl _value,
    $Res Function(_$OnboardingInterestsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OnboardingInterestsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableInterests = null,
    Object? selectedInterests = null,
  }) {
    return _then(
      _$OnboardingInterestsStateImpl(
        availableInterests: null == availableInterests
            ? _value._availableInterests
            : availableInterests // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        selectedInterests: null == selectedInterests
            ? _value._selectedInterests
            : selectedInterests // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
      ),
    );
  }
}

/// @nodoc

class _$OnboardingInterestsStateImpl implements _OnboardingInterestsState {
  const _$OnboardingInterestsStateImpl({
    final List<String> availableInterests = const [],
    final Set<String> selectedInterests = const {},
  }) : _availableInterests = availableInterests,
       _selectedInterests = selectedInterests;

  final List<String> _availableInterests;
  @override
  @JsonKey()
  List<String> get availableInterests {
    if (_availableInterests is EqualUnmodifiableListView)
      return _availableInterests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableInterests);
  }

  final Set<String> _selectedInterests;
  @override
  @JsonKey()
  Set<String> get selectedInterests {
    if (_selectedInterests is EqualUnmodifiableSetView)
      return _selectedInterests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedInterests);
  }

  @override
  String toString() {
    return 'OnboardingInterestsState(availableInterests: $availableInterests, selectedInterests: $selectedInterests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingInterestsStateImpl &&
            const DeepCollectionEquality().equals(
              other._availableInterests,
              _availableInterests,
            ) &&
            const DeepCollectionEquality().equals(
              other._selectedInterests,
              _selectedInterests,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_availableInterests),
    const DeepCollectionEquality().hash(_selectedInterests),
  );

  /// Create a copy of OnboardingInterestsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingInterestsStateImplCopyWith<_$OnboardingInterestsStateImpl>
  get copyWith =>
      __$$OnboardingInterestsStateImplCopyWithImpl<
        _$OnboardingInterestsStateImpl
      >(this, _$identity);
}

abstract class _OnboardingInterestsState implements OnboardingInterestsState {
  const factory _OnboardingInterestsState({
    final List<String> availableInterests,
    final Set<String> selectedInterests,
  }) = _$OnboardingInterestsStateImpl;

  @override
  List<String> get availableInterests;
  @override
  Set<String> get selectedInterests;

  /// Create a copy of OnboardingInterestsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingInterestsStateImplCopyWith<_$OnboardingInterestsStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
