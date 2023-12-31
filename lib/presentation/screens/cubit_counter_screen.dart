import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

// the child returned by the build method
// is what is displayed in the application
// when the app is started.
//Cubit only repaint the widgets that
// have changed.

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increseaCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    //listening to changes in the cubit, this line of code is rebuilding the widget when the cubit changes, but not when the state changes. Because of copyWith, we are returning a new instance of the object state with the same data as the previous one
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        //To avoid rebuilding the widget, we use the select method, and avoid the line 32, because it is not needed. We access directly to the value of the state.
        //this context.select returns all Cubit.
        title: context.select((CounterCubit value) {
          return Text('Cubit Counter ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // this line is avoided when you use Equatable, which is a package that allows you to compare objects.
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Text('Cubit Value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          heroTag: '1',
          child: const Text('+3'),
          onPressed: () {
            increseaCounterBy(context, 3);
          },
        ),
        const SizedBox(height: 15),
        FloatingActionButton(
          heroTag: '2',
          child: const Text('+2'),
          onPressed: () {
            increseaCounterBy(context, 2);
          },
        ),
        const SizedBox(height: 15),
        FloatingActionButton(
          heroTag: '3',
          child: const Text('+1'),
          onPressed: () {
            increseaCounterBy(context, 1);
          },
        ),
      ]),
    );
  }
}
