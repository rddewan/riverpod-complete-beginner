


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_beginner/model/user.dart';
import 'package:riverpod_beginner/state/user_state.dart';

final usersProvider = NotifierProvider<UserViewModel, UserState>(UserViewModel.new);

class UserViewModel extends Notifier<UserState> {
  @override
  UserState build() {
    return const UserState(isLoading: true);
  }

  void addUser(User user) {
    state = state.copyWith(isLoading: true, isAdded: false);

    final currentUsers = state.users;

    state = state.copyWith(
      isLoading: false,
      users: [...currentUsers, user],
      isAdded: true,
    );


  }

}