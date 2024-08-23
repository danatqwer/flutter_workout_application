// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_list_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WorkoutListBlocState {
  bool get loading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<Workout> get workouts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutListBlocStateCopyWith<WorkoutListBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutListBlocStateCopyWith<$Res> {
  factory $WorkoutListBlocStateCopyWith(WorkoutListBlocState value,
          $Res Function(WorkoutListBlocState) then) =
      _$WorkoutListBlocStateCopyWithImpl<$Res, WorkoutListBlocState>;
  @useResult
  $Res call({bool loading, String? errorMessage, List<Workout> workouts});
}

/// @nodoc
class _$WorkoutListBlocStateCopyWithImpl<$Res,
        $Val extends WorkoutListBlocState>
    implements $WorkoutListBlocStateCopyWith<$Res> {
  _$WorkoutListBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorMessage = freezed,
    Object? workouts = null,
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
      workouts: null == workouts
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutListBlocStateImplCopyWith<$Res>
    implements $WorkoutListBlocStateCopyWith<$Res> {
  factory _$$WorkoutListBlocStateImplCopyWith(_$WorkoutListBlocStateImpl value,
          $Res Function(_$WorkoutListBlocStateImpl) then) =
      __$$WorkoutListBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, String? errorMessage, List<Workout> workouts});
}

/// @nodoc
class __$$WorkoutListBlocStateImplCopyWithImpl<$Res>
    extends _$WorkoutListBlocStateCopyWithImpl<$Res, _$WorkoutListBlocStateImpl>
    implements _$$WorkoutListBlocStateImplCopyWith<$Res> {
  __$$WorkoutListBlocStateImplCopyWithImpl(_$WorkoutListBlocStateImpl _value,
      $Res Function(_$WorkoutListBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorMessage = freezed,
    Object? workouts = null,
  }) {
    return _then(_$WorkoutListBlocStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      workouts: null == workouts
          ? _value._workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
    ));
  }
}

/// @nodoc

class _$WorkoutListBlocStateImpl implements _WorkoutListBlocState {
  const _$WorkoutListBlocStateImpl(
      {this.loading = true,
      this.errorMessage,
      final List<Workout> workouts = const <Workout>[]})
      : _workouts = workouts;

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? errorMessage;
  final List<Workout> _workouts;
  @override
  @JsonKey()
  List<Workout> get workouts {
    if (_workouts is EqualUnmodifiableListView) return _workouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  String toString() {
    return 'WorkoutListBlocState(loading: $loading, errorMessage: $errorMessage, workouts: $workouts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutListBlocStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._workouts, _workouts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, errorMessage,
      const DeepCollectionEquality().hash(_workouts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutListBlocStateImplCopyWith<_$WorkoutListBlocStateImpl>
      get copyWith =>
          __$$WorkoutListBlocStateImplCopyWithImpl<_$WorkoutListBlocStateImpl>(
              this, _$identity);
}

abstract class _WorkoutListBlocState implements WorkoutListBlocState {
  const factory _WorkoutListBlocState(
      {final bool loading,
      final String? errorMessage,
      final List<Workout> workouts}) = _$WorkoutListBlocStateImpl;

  @override
  bool get loading;
  @override
  String? get errorMessage;
  @override
  List<Workout> get workouts;
  @override
  @JsonKey(ignore: true)
  _$$WorkoutListBlocStateImplCopyWith<_$WorkoutListBlocStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
