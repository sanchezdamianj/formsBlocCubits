import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    //Handlres events
    //we define the methods, and we pass the reference to the function to the handlers.
    on<CounterIncreased>(_onCounterIncreased);

    on<CounterReset>(_onCounterReset);
  }

  void _onCounterIncreased(
    CounterIncreased event,
    Emitter<CounterState> emit,
  ) {
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1));
  }

  void _onCounterReset(
    CounterReset event,
    Emitter<CounterState> emit,
  ) {
    emit(state.copyWith(counter: event.counter));
  }
}
