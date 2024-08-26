// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_add_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkoutAddBlocState {
  bool get loading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutAddBlocStateCopyWith<WorkoutAddBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutAddBlocStateCopyWith<$Res> {
  factory $WorkoutAddBlocStateCopyWith(
          WorkoutAddBlocState value, $Res Function(WorkoutAddBlocState) then) =
      _$WorkoutAddBlocStateCopyWithImpl<$Res, WorkoutAddBlocState>;
  @useResult
  $Res call({bool loading, String? errorMessage, String? successMessage});
}

/// @nodoc
class _$WorkoutAddBlocStateCopyWithImpl<$Res, $Val extends WorkoutAddBlocState>
    implements $WorkoutAddBlocStateCopyWith<$Res> {
  _$WorkoutAddBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutAddBlocStateImplCopyWith<$Res>
    implements $WorkoutAddBlocStateCopyWith<$Res> {
  factory _$$WorkoutAddBlocStateImplCopyWith(_$WorkoutAddBlocStateImpl value,
          $Res Function(_$WorkoutAddBlocStateImpl) then) =
      __$$WorkoutAddBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, String? errorMessage, String? successMessage});
}

/// @nodoc
class __$$WorkoutAddBlocStateImplCopyWithImpl<$Res>
    extends _$WorkoutAddBlocStateCopyWithImpl<$Res, _$WorkoutAddBlocStateImpl>
    implements _$$WorkoutAddBlocStateImplCopyWith<$Res> {
  __$$WorkoutAddBlocStateImplCopyWithImpl(_$WorkoutAddBlocStateImpl _value,
      $Res Function(_$WorkoutAddBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_$WorkoutAddBlocStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WorkoutAddBlocStateImpl implements _WorkoutAddBlocState {
  const _$WorkoutAddBlocStateImpl(
      {this.loading = true, this.errorMessage, this.successMessage});

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? errorMessage;
  @override
  final String? successMessage;

  @override
  String toString() {
    return 'WorkoutAddBlocState(loading: $loading, errorMessage: $errorMessage, successMessage: $successMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutAddBlocStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, loading, errorMessage, successMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutAddBlocStateImplCopyWith<_$WorkoutAddBlocStateImpl> get copyWith =>
      __$$WorkoutAddBlocStateImplCopyWithImpl<_$WorkoutAddBlocStateImpl>(
          this, _$identity);
}

abstract class _WorkoutAddBlocState implements WorkoutAddBlocState {
  const factory _WorkoutAddBlocState(
      {final bool loading,
      final String? errorMessage,
      final String? successMessage}) = _$WorkoutAddBlocStateImpl;

  @override
  bool get loading;
  @override
  String? get errorMessage;
  @override
  String? get successMessage;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutAddBlocStateImplCopyWith<_$WorkoutAddBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
