

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_beginner/model/user.dart';
import 'package:riverpod_beginner/repository/user_repository.dart';

part 'fetch_user.g.dart';

// final fetchUserProvider = Provider<FetchUser>((ref) {
//   final userRepository = ref.watch(userRepositoryProvider);
//   return FetchUser(userRepository);
// });

@riverpod
FetchUser fetchUser(FetchUserRef ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return FetchUser(userRepository);
}


class FetchUser {

  final UserRepository userRepository;

  FetchUser(this.userRepository);

  Future<List<User>> fetchUsers() async {
    await Future.delayed(const Duration(seconds: 3));
    return await userRepository.fetchUsers();
  }
}