

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/providers/user_list_provider.dart';
import 'package:riverpod_beginner/screen/add_user_screen.dart';
import 'package:riverpod_beginner/view_model/user_view_model.dart';

class UserListScreen extends ConsumerStatefulWidget {
  const UserListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<UserListScreen> {
  late TextEditingController _userController;

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(userViewModelProvider.notifier).fetchUsers();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    debugPrint('UserScreen dispose');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('UserScreen build');
    final users = ref.watch(userViewModelProvider.select((state) => state.users));
    final user1 = ref.watch(userListProvider(2));
    final user2 = ref.watch(userProvider(1,10, userName: 'John')); 
    debugPrint(user2.toString());

    debugPrint(user1.toString());
    
    return Scaffold(
      appBar: AppBar(title: const Text('User List Screen'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [           
              
            SliverFillRemaining(
              child: ListView.builder(
                itemCount: users.length, 
                itemBuilder: (context,index) {
                  final data = users[index];

                  return ListTile(
                    title: Text(data.username),
                    subtitle: Text(data.email),
                  );
                },
              ),
            )
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddUserScreen()),
          );
        }, 
        child: const Icon(Icons.add),
      ),
    );
  }
}