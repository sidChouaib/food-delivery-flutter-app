part of 'counter_bloc.dart';

sealed class CounterState {
  const CounterState();
}

class CounterInitial extends CounterState {}

class CounterChangedState extends CounterState {
  //We use this state whenever there is a change in the "counter" variable.
  final int counter;
  const CounterChangedState({required this.counter});
}

class DeleteState extends CounterState {}
