

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_beginner/model/user.dart';

part 'async_user_provider.g.dart';

final asyncUserProvider = FutureProvider<List<User>>((ref) async {
  await Future.delayed(const Duration(seconds: 3));
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
      User(
        id: 3,
        username: 'Flutter',
        age: 30,
        email: '5gqzv@example.com',
      ),
      User(
        id: 4,
        username: 'Flutter',
        age: 30,
        email: '5gqzv@example.com',
      ),
      User(
        id: 5,
        username: 'Flutter',
        age: 30,
        email: '5gqzv@example.com',
      )    
    ];
  return users;
});

@riverpod
Future<List<User>> fetchFutureUsers (FetchFutureUsersRef ref) async {
  await Future.delayed(const Duration(seconds: 3));
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
      User(
        id: 3,
        username: 'Flutter',
        age: 30,
        email: '5gqzv@example.com',
      ),
      User(
        id: 4,
        username: 'Flutter',
        age: 30,
        email: '5gqzv@example.com',
      ),
      User(
        id: 5,
        username: 'Flutter',
        age: 30,
        email: '5gqzv@example.com',
      )    
    ];
  
  return users;
}