

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNotifierProvider = AutoDisposeNotifierProvider<UserNotifier, String>(UserNotifier.new);

class UserNotifier extends AutoDisposeNotifier<String> {

  @override
  String build() {
    final keepAlive = ref.keepAlive();
    Timer? timer;

    ref.onDispose(() {
      debugPrint('UserNotifier dispose');
      timer?.cancel();
    });

    ref.onCancel(() {
      debugPrint('UserNotifier onCancel is Called');
      timer = Timer(const Duration(seconds: 10), () {
        
        keepAlive.close();
        debugPrint('UserNotifier onCancel');
      });

    });

    ref.onResume(() {
      debugPrint('UserNotifier onResume');
      timer?.cancel();
    });

    
    return '-';
  }


  void update(String value) {
    state = value;
  }
}