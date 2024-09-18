

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/model/user.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

class UserRepository {

  Future<List<User>> fetchUsers() async {
    return const [
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
  }
}