

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_beginner/model/user.dart';

part 'user_list_provider.g.dart';

final userListProvider = Provider.autoDispose.family<User, int>((ref, id) {

  const users = [
      User(
        id: 1,
        username: 'Flutter',
        age: 30,
        email: '5gqzv@example.com'  
      ),
      User(
        id: 2,
        username: 'Flutter',
        age: 30,
        email: '5gqzv@example.com'  
      ),    
    ];

  final user = users.firstWhere((user) => user.id == id);

  return user;
});


@riverpod
User user(UserRef ref, int id, int age, {String? userName}) {
  debugPrint('userProvider: $userName');
  const users = [
      User(
        id: 1,
        username: 'Flutter',
        age: 30,
        email: '5gqzv@example.com'  
      ),
      User(
        id: 2,
        username: 'Flutter',
        age: 30,
        email: '5gqzv@example.com'  
      ),    
    ];

  final user = users.firstWhere((user) => user.id == id);

  return user;
}
