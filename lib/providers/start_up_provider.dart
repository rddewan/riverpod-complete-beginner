import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_beginner/providers/user_list_provider.dart';

part 'start_up_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> startUp(StartUpRef ref, {required String flavour}) async {
  ref.onDispose(() {
    ref.invalidate(userListProvider);
  });

  await Future.delayed(const Duration(seconds: 3));
  debugPrint('flavour: $flavour');
  // init db
  // initHive();
  // crash collection
  debugPrint('startUp: DONE');
  
}

