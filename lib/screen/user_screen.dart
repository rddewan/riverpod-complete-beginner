

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/providers/user_notifier_provider.dart';
//import 'package:riverpod_beginner/view_model/user_view_model.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  late TextEditingController _userController;

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    debugPrint('UserScreen dispose');
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(title: const Text('User Screen'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:  Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      controller: _userController,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),              
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(userNotifierProvider.notifier).update(_userController.text);
                      _userController.clear();
                    }, 
                    child: const Text('Add User'),
                  )
                ],
              ),
            ),
        
            SliverToBoxAdapter(
              child: Text('User: $user'),
            ),
                    
            
          ],
        ),
      ),
    );
  }
}