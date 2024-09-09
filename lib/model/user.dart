

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    @Default(-1) int id,
    @Default('') String username,
    @Default(-1) int age,
    @Default('') String email
  }) = _User;
}