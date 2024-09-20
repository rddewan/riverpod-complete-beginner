

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_beginner/model/user.dart';

part 'stream_user_provider.g.dart';

final streamUserProvider = StreamProvider<User>((ref) async* {
  int count = 1;

  while (count <= 21) {

    await Future.delayed(const Duration(seconds: 1));
    yield User(
      id: count,
      username: 'Flutter $count',
      age: 30 + count,
      email: '5gqzv@example.com'  
    );
    count++;
    
  }
});

@riverpod 
Stream<User> userStream(UserStreamRef ref) {
  return Stream.periodic(
    const Duration(seconds: 1),
    (count) => User(
      id: count,
      username: 'Flutter $count',
      age: 30 + count,
      email: '5gqzv@example.com'
  ),);
}

