


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/providers/async_user_provider.dart';


class FutureUserListScreen extends ConsumerStatefulWidget {
  const FutureUserListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<FutureUserListScreen> {
 
  @override
  Widget build(BuildContext context) {
    final users = ref.watch(fetchFutureUsersProvider);
  
    return Scaffold(
      appBar: AppBar(title: const Text('User List Screen'),),
      body: users.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final user = data[index];

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