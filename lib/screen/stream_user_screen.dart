


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/model/user.dart';
import 'package:riverpod_beginner/providers/async_user_provider.dart';
import 'package:riverpod_beginner/providers/stream_user_provider.dart';


class StreamUserListScreen extends ConsumerStatefulWidget {
  const StreamUserListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<StreamUserListScreen> {
  List<User> list = [];
 
  @override
  Widget build(BuildContext context) {
    final users = ref.watch(userStreamProvider);
  
    return Scaffold(
      appBar: AppBar(title: const Text('User List Screen'),),
      body: users.when(
        data: (data) {
          list.add(data);

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final user = list[index];

              return ListTile(
                title: Text(user.username),
                subtitle: Text(user.email),
              );
            },
          );

        }, 
        error: (e,s) {
          return Text(e.toString());
        }, 
        loading: () {
          return const Center(child: CircularProgressIndicator(),);
        }
      )
    );
  }
}