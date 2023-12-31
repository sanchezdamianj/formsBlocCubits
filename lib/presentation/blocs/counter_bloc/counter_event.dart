part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

//you could compare events with this line of code, but it's not necessary.
  @override
  List<Object> get props => [];
}

class CounterIncreased extends CounterEvent {
  final int value;

  const CounterIncreased(this.value);
}

class CounterReset extends CounterEvent {
  final int counter;

  const CounterReset({this.counter = 0});
}
