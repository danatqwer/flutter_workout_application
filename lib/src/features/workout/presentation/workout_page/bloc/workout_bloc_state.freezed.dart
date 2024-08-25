// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkoutBlocState {
  bool get loading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Workout get workout => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  bool get workoutStarted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutBlocStateCopyWith<WorkoutBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutBlocStateCopyWith<$Res> {
  factory $WorkoutBlocStateCopyWith(
          WorkoutBlocState value, $Res Function(WorkoutBlocState) then) =
      _$WorkoutBlocStateCopyWithImpl<$Res, WorkoutBlocState>;
  @useResult
  $Res call(
      {bool loading,
      String? errorMessage,
      Workout workout,
      int selectedIndex,
      bool workoutStarted});
}

/// @nodoc
class _$WorkoutBlocStateCopyWithImpl<$Res, $Val extends WorkoutBlocState>
    implements $WorkoutBlocStateCopyWith<$Res> {
  _$WorkoutBlocStateCopyWithImpl(this._value, this._then);

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
    Object? selectedIndex = null,
    Object? workoutStarted = null,
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
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      workoutStarted: null == workoutStarted
          ? _value.workoutStarted
          : workoutStarted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutBlocStateImplCopyWith<$Res>
    implements $WorkoutBlocStateCopyWith<$Res> {
  factory _$$WorkoutBlocStateImplCopyWith(_$WorkoutBlocStateImpl value,
          $Res Function(_$WorkoutBlocStateImpl) then) =
      __$$WorkoutBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      String? errorMessage,
      Workout workout,
      int selectedIndex,
      bool workoutStarted});
}

/// @nodoc
class __$$WorkoutBlocStateImplCopyWithImpl<$Res>
    extends _$WorkoutBlocStateCopyWithImpl<$Res, _$WorkoutBlocStateImpl>
    implements _$$WorkoutBlocStateImplCopyWith<$Res> {
  __$$WorkoutBlocStateImplCopyWithImpl(_$WorkoutBlocStateImpl _value,
      $Res Function(_$WorkoutBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorMessage = freezed,
    Object? workout = null,
    Object? selectedIndex = null,
    Object? workoutStarted = null,
  }) {
    return _then(_$WorkoutBlocStateImpl(
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
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      workoutStarted: null == workoutStarted
          ? _value.workoutStarted
          : workoutStarted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WorkoutBlocStateImpl implements _WorkoutBlocState {
  const _$WorkoutBlocStateImpl(
      {this.loading = true,
      this.errorMessage,
      this.workout = const Workout(id: '', name: '', items: []),
      this.selectedIndex = 0,
      this.workoutStarted = false});

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final Workout workout;
  @override
  @JsonKey()
  final int selectedIndex;
  @override
  @JsonKey()
  final bool workoutStarted;

  @override
  String toString() {
    return 'WorkoutBlocState(loading: $loading, errorMessage: $errorMessage, workout: $workout, selectedIndex: $selectedIndex, workoutStarted: $workoutStarted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutBlocStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.workout, workout) || other.workout == workout) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.workoutStarted, workoutStarted) ||
                other.workoutStarted == workoutStarted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, errorMessage, workout,
      selectedIndex, workoutStarted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutBlocStateImplCopyWith<_$WorkoutBlocStateImpl> get copyWith =>
      __$$WorkoutBlocStateImplCopyWithImpl<_$WorkoutBlocStateImpl>(
          this, _$identity);
}

abstract class _WorkoutBlocState implements WorkoutBlocState {
  const factory _WorkoutBlocState(
      {final bool loading,
      final String? errorMessage,
      final Workout workout,
      final int selectedIndex,
      final bool workoutStarted}) = _$WorkoutBlocStateImpl;

  @override
  bool get loading;
  @override
  String? get errorMessage;
  @override
  Workout get workout;
  @override
  int get selectedIndex;
  @override
  bool get workoutStarted;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutBlocStateImplCopyWith<_$WorkoutBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
