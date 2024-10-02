

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/providers/start_up_provider.dart';

class StartUpScreen extends ConsumerWidget {
  final String flavour;
  final WidgetBuilder builder;
  const StartUpScreen({super.key, required this.flavour, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final asyncValue = ref.watch(startUpProvider(flavour: flavour));
    return asyncValue.when(
      data: (data) {
        return builder(context);
      }, 
      error: (error, stackTrace) {
        return Material(child: Center(child: Column(
          children: [
            Text(error.toString()),
            const SizedBox(height: 8,),
            ElevatedButton(onPressed: () {
              ref.invalidate(startUpProvider);
            }, 
            child: const Text('Retry'),
          ),
          ],
        )));
      }, 
      loading: () {
        return const Material(child: Center(child: CircularProgressIndicator()));
      }
    );
  }
}