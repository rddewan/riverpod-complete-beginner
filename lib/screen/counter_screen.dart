

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/providers/counter_state_provider.dart';

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
 

  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counterStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Screen'),),
      body: Column(
        children: [
          Text('You have pushed the button this many times:$counter'),
          Text('$counter', style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(counterStateProvider.notifier).state++;              
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),

          const SizedBox(width: 10),

          FloatingActionButton(
            onPressed: () {
              ref.read(counterStateProvider.notifier).state--;
             
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}