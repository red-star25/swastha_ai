import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {}

class StateInitial extends BaseState {
  @override
  List<Object> get props => [];
}

class StateOnSuccess<T> extends BaseState {
  final T response;
  StateOnSuccess(this.response);
  @override
  List<Object?> get props => [];
}

//...define other state
