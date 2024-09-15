

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/model/user.dart';
import 'package:riverpod_beginner/view_model/user_view_model.dart';

class UserDetailScreen1 extends StatelessWidget {
const UserDetailScreen1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
        
    return Consumer(
      builder: (context, ref, child) {
        final users = ref.watch(usersProvider.select((state) => state.users));

        return Container(
          child: Column(
              children: [
        
                ElevatedButton(
                  onPressed: () {
                    ref.read(usersProvider.notifier).addUser(User(id: 1, username: 'John', age: 20, email: 'j@j.com'));                    
                  }, 
                  child: const Text('Click Me!'),
                )
              ],
          ),
        );
      }
    );
  }
}

class UserDetailScreen extends ConsumerWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider.select((state) => state.users));

    return Container(
      child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _add(ref);
              }, 
              child: const Text('Click Me!'),
            )
          ],
      ),
    );
  }

  void _add( WidgetRef ref) {

    
  }
}