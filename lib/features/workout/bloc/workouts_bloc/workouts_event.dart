import 'package:equatable/equatable.dart';

sealed class WorkoutsEvent extends Equatable {
  const WorkoutsEvent();

  @override
  List<Object?> get props => [];
}

class WorkoutsInitializeEvent extends WorkoutsEvent {}
