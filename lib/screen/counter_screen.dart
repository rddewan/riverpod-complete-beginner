

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/providers/counter_async_notifier_provider.dart';
import 'package:riverpod_beginner/providers/counter_notifier_provider.dart';
//import 'package:riverpod_beginner/providers/counter_state_provider.dart';

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
 

  @override
  Widget build(BuildContext context) {
    //final counter = ref.watch(counterStateProvider);
    //final counter = ref.watch(counterNotifierProvider);
    final counterAsyn = ref.watch(counterAsyncNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Screen'),),
      body: Column(
        children: [
          counterAsyn.when(
            data: (data) => Text('You have pushed the button this many times: $data'),
            error: (error, stackTrace) => Text('$error'),
            loading: () => const CircularProgressIndicator(),
          )

          //Text('You have pushed the button this many times:$counter'),
          //Text('$counter', style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              //ref.read(counterStateProvider.notifier).state++; 
              // ref.read(counterNotifierProvider.notifier).increment();             
              ref.read(counterAsyncNotifierProvider.notifier).increment();             
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),

          const SizedBox(width: 10),

          FloatingActionButton(
            onPressed: () {
              //ref.read(counterStateProvider.notifier).state--;
              ref.read(counterAsyncNotifierProvider.notifier).decrement();   
             
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),

          const SizedBox(width: 10),

          FloatingActionButton(
            onPressed: () {
              //ref.read(counterStateProvider.notifier).state--;
              ref.read(counterAsyncNotifierProvider.notifier).reset();   
             
            },
            tooltip: 'Reset',
            child: const Icon(Icons.restore),
          ),
        ],
      ),
    );
  }
}