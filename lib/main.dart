import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/screen/start_up_screen.dart';
//import 'package:riverpod_beginner/screen/future_user_screen.dart';
import 'package:riverpod_beginner/screen/stream_user_screen.dart';
//import 'package:riverpod_beginner/screen/counter_screen.dart';
//import 'package:riverpod_beginner/screen/user_list_screen.dart';

void main() {
  // init DB
  // initHive();
  // crash collection
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    ProviderScope(child: StartUpScreen(
      flavour: 'dev',
      builder: (context) {
        return const MainApp();
      }
    )),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: StreamUserListScreen(),
        ),
      ),
    );
  }
}
