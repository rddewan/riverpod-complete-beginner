


import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_beginner/model/user.dart';
import 'package:riverpod_beginner/state/user_state.dart';
import 'package:riverpod_beginner/usecase/fetch_user.dart';

// final usersProvider = NotifierProvider<UserViewModel, UserState>(UserViewModel.new);

// class UserViewModel extends Notifier<UserState> {
//   @override
//   UserState build() {
//     debugPrint('UserViewModel build');
//     ref.onDispose(() {
//       debugPrint('UserViewModel disposed');
//     });
//     return const UserState(isLoading: true);
//   }

//   void addUser(User user) {
//     state = state.copyWith(isLoading: true, isAdded: false, error: null);

//     final currentUsers = state.users;

//     state = state.copyWith(
//       isLoading: false,
//       users: [...currentUsers, user],
//       isAdded: true,
//       //error: 'Something went wrong',
//     );


//   }

// }


part 'user_view_model.g.dart';


@Riverpod(keepAlive: true)
// @riverpod
class UserViewModel extends _$UserViewModel {
  @override
  UserState build() {
    debugPrint('UserViewModel build');
    ref.onDispose(() {
      debugPrint('UserViewModel disposed');
    });
    return const UserState(isLoading: true);
  }

  void addUser(User user) {
    state = state.copyWith(isLoading: true, isAdded: false, error: null);

    final currentUsers = state.users;

    state = state.copyWith(
      isLoading: false,
      users: [...currentUsers, user],
      isAdded: true,
      //error: 'Something went wrong',
    );

  }

  Future<void> fetchUsers() async {    
    final users = await ref.read(fetchUserProvider).fetchUsers();
    state = state.copyWith(isLoading: false, users: users);
  }

}