// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_edit_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkoutEditBlocInitializeState {
  bool get loading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Workout get workout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutEditBlocInitializeStateCopyWith<WorkoutEditBlocInitializeState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutEditBlocInitializeStateCopyWith<$Res> {
  factory $WorkoutEditBlocInitializeStateCopyWith(
          WorkoutEditBlocInitializeState value,
          $Res Function(WorkoutEditBlocInitializeState) then) =
      _$WorkoutEditBlocInitializeStateCopyWithImpl<$Res,
          WorkoutEditBlocInitializeState>;
  @useResult
  $Res call({bool loading, String? errorMessage, Workout workout});
}

/// @nodoc
class _$WorkoutEditBlocInitializeStateCopyWithImpl<$Res,
        $Val extends WorkoutEditBlocInitializeState>
    implements $WorkoutEditBlocInitializeStateCopyWith<$Res> {
  _$WorkoutEditBlocInitializeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorMessage = freezed,
    Object? workout = null,
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
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutEditBlocInitializeStateImplCopyWith<$Res>
    implements $WorkoutEditBlocInitializeStateCopyWith<$Res> {
  factory _$$WorkoutEditBlocInitializeStateImplCopyWith(
          _$WorkoutEditBlocInitializeStateImpl value,
          $Res Function(_$WorkoutEditBlocInitializeStateImpl) then) =
      __$$WorkoutEditBlocInitializeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, String? errorMessage, Workout workout});
}

/// @nodoc
class __$$WorkoutEditBlocInitializeStateImplCopyWithImpl<$Res>
    extends _$WorkoutEditBlocInitializeStateCopyWithImpl<$Res,
        _$WorkoutEditBlocInitializeStateImpl>
    implements _$$WorkoutEditBlocInitializeStateImplCopyWith<$Res> {
  __$$WorkoutEditBlocInitializeStateImplCopyWithImpl(
      _$WorkoutEditBlocInitializeStateImpl _value,
      $Res Function(_$WorkoutEditBlocInitializeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorMessage = freezed,
    Object? workout = null,
  }) {
    return _then(_$WorkoutEditBlocInitializeStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      workout: null == workout
          ? _value.workout
          : workout // ignore: cast_nullable_to_non_nullable
              as Workout,
    ));
  }
}

/// @nodoc

class _$WorkoutEditBlocInitializeStateImpl
    implements _WorkoutEditBlocInitializeState {
  const _$WorkoutEditBlocInitializeStateImpl(
      {this.loading = true,
      this.errorMessage,
      this.workout = const Workout(id: '', name: '', items: [])});

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final Workout workout;

  @override
  String toString() {
    return 'WorkoutEditBlocInitializeState(loading: $loading, errorMessage: $errorMessage, workout: $workout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutEditBlocInitializeStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.workout, workout) || other.workout == workout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, errorMessage, workout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutEditBlocInitializeStateImplCopyWith<
          _$WorkoutEditBlocInitializeStateImpl>
      get copyWith => __$$WorkoutEditBlocInitializeStateImplCopyWithImpl<
          _$WorkoutEditBlocInitializeStateImpl>(this, _$identity);
}

abstract class _WorkoutEditBlocInitializeState
    implements WorkoutEditBlocInitializeState {
  const factory _WorkoutEditBlocInitializeState(
      {final bool loading,
      final String? errorMessage,
      final Workout workout}) = _$WorkoutEditBlocInitializeStateImpl;

  @override
  bool get loading;
  @override
  String? get errorMessage;
  @override
  Workout get workout;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutEditBlocInitializeStateImplCopyWith<
          _$WorkoutEditBlocInitializeStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WorkoutEditBlocSaveState {
  bool get loading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutEditBlocSaveStateCopyWith<WorkoutEditBlocSaveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutEditBlocSaveStateCopyWith<$Res> {
  factory $WorkoutEditBlocSaveStateCopyWith(WorkoutEditBlocSaveState value,
          $Res Function(WorkoutEditBlocSaveState) then) =
      _$WorkoutEditBlocSaveStateCopyWithImpl<$Res, WorkoutEditBlocSaveState>;
  @useResult
  $Res call({bool loading, String? errorMessage, String? successMessage});
}

/// @nodoc
class _$WorkoutEditBlocSaveStateCopyWithImpl<$Res,
        $Val extends WorkoutEditBlocSaveState>
    implements $WorkoutEditBlocSaveStateCopyWith<$Res> {
  _$WorkoutEditBlocSaveStateCopyWithImpl(this._value, this._then);

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
abstract class _$$WorkoutEditBlocSaveStateImplCopyWith<$Res>
    implements $WorkoutEditBlocSaveStateCopyWith<$Res> {
  factory _$$WorkoutEditBlocSaveStateImplCopyWith(
          _$WorkoutEditBlocSaveStateImpl value,
          $Res Function(_$WorkoutEditBlocSaveStateImpl) then) =
      __$$WorkoutEditBlocSaveStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, String? errorMessage, String? successMessage});
}

/// @nodoc
class __$$WorkoutEditBlocSaveStateImplCopyWithImpl<$Res>
    extends _$WorkoutEditBlocSaveStateCopyWithImpl<$Res,
        _$WorkoutEditBlocSaveStateImpl>
    implements _$$WorkoutEditBlocSaveStateImplCopyWith<$Res> {
  __$$WorkoutEditBlocSaveStateImplCopyWithImpl(
      _$WorkoutEditBlocSaveStateImpl _value,
      $Res Function(_$WorkoutEditBlocSaveStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_$WorkoutEditBlocSaveStateImpl(
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

class _$WorkoutEditBlocSaveStateImpl implements _WorkoutEditBlocSaveState {
  const _$WorkoutEditBlocSaveStateImpl(
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
    return 'WorkoutEditBlocSaveState(loading: $loading, errorMessage: $errorMessage, successMessage: $successMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutEditBlocSaveStateImpl &&
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
  _$$WorkoutEditBlocSaveStateImplCopyWith<_$WorkoutEditBlocSaveStateImpl>
      get copyWith => __$$WorkoutEditBlocSaveStateImplCopyWithImpl<
          _$WorkoutEditBlocSaveStateImpl>(this, _$identity);
}

abstract class _WorkoutEditBlocSaveState implements WorkoutEditBlocSaveState {
  const factory _WorkoutEditBlocSaveState(
      {final bool loading,
      final String? errorMessage,
      final String? successMessage}) = _$WorkoutEditBlocSaveStateImpl;

  @override
  bool get loading;
  @override
  String? get errorMessage;
  @override
  String? get successMessage;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutEditBlocSaveStateImplCopyWith<_$WorkoutEditBlocSaveStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WorkoutEditBlocDeleteState {
  bool get loading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutEditBlocDeleteStateCopyWith<WorkoutEditBlocDeleteState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutEditBlocDeleteStateCopyWith<$Res> {
  factory $WorkoutEditBlocDeleteStateCopyWith(WorkoutEditBlocDeleteState value,
          $Res Function(WorkoutEditBlocDeleteState) then) =
      _$WorkoutEditBlocDeleteStateCopyWithImpl<$Res,
          WorkoutEditBlocDeleteState>;
  @useResult
  $Res call({bool loading, String? errorMessage, String? successMessage});
}

/// @nodoc
class _$WorkoutEditBlocDeleteStateCopyWithImpl<$Res,
        $Val extends WorkoutEditBlocDeleteState>
    implements $WorkoutEditBlocDeleteStateCopyWith<$Res> {
  _$WorkoutEditBlocDeleteStateCopyWithImpl(this._value, this._then);

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
abstract class _$$WorkoutEditBlocDeleteStateImplCopyWith<$Res>
    implements $WorkoutEditBlocDeleteStateCopyWith<$Res> {
  factory _$$WorkoutEditBlocDeleteStateImplCopyWith(
          _$WorkoutEditBlocDeleteStateImpl value,
          $Res Function(_$WorkoutEditBlocDeleteStateImpl) then) =
      __$$WorkoutEditBlocDeleteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, String? errorMessage, String? successMessage});
}

/// @nodoc
class __$$WorkoutEditBlocDeleteStateImplCopyWithImpl<$Res>
    extends _$WorkoutEditBlocDeleteStateCopyWithImpl<$Res,
        _$WorkoutEditBlocDeleteStateImpl>
    implements _$$WorkoutEditBlocDeleteStateImplCopyWith<$Res> {
  __$$WorkoutEditBlocDeleteStateImplCopyWithImpl(
      _$WorkoutEditBlocDeleteStateImpl _value,
      $Res Function(_$WorkoutEditBlocDeleteStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(_$WorkoutEditBlocDeleteStateImpl(
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

class _$WorkoutEditBlocDeleteStateImpl implements _WorkoutEditBlocDeleteState {
  const _$WorkoutEditBlocDeleteStateImpl(
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
    return 'WorkoutEditBlocDeleteState(loading: $loading, errorMessage: $errorMessage, successMessage: $successMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutEditBlocDeleteStateImpl &&
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
  _$$WorkoutEditBlocDeleteStateImplCopyWith<_$WorkoutEditBlocDeleteStateImpl>
      get copyWith => __$$WorkoutEditBlocDeleteStateImplCopyWithImpl<
          _$WorkoutEditBlocDeleteStateImpl>(this, _$identity);
}

abstract class _WorkoutEditBlocDeleteState
    implements WorkoutEditBlocDeleteState {
  const factory _WorkoutEditBlocDeleteState(
      {final bool loading,
      final String? errorMessage,
      final String? successMessage}) = _$WorkoutEditBlocDeleteStateImpl;

  @override
  bool get loading;
  @override
  String? get errorMessage;
  @override
  String? get successMessage;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutEditBlocDeleteStateImplCopyWith<_$WorkoutEditBlocDeleteStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
