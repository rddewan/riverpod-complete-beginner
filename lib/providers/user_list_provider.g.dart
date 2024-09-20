// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userHash() => r'0acbb51382d5455a969612f46a5ad5598633cf93';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [user].
@ProviderFor(user)
const userProvider = UserFamily();

/// See also [user].
class UserFamily extends Family<User> {
  /// See also [user].
  const UserFamily();

  /// See also [user].
  UserProvider call(
    int id,
    int age, {
    String? userName,
  }) {
    return UserProvider(
      id,
      age,
      userName: userName,
    );
  }

  @override
  UserProvider getProviderOverride(
    covariant UserProvider provider,
  ) {
    return call(
      provider.id,
      provider.age,
      userName: provider.userName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userProvider';
}

/// See also [user].
class UserProvider extends AutoDisposeProvider<User> {
  /// See also [user].
  UserProvider(
    int id,
    int age, {
    String? userName,
  }) : this._internal(
          (ref) => user(
            ref as UserRef,
            id,
            age,
            userName: userName,
          ),
          from: userProvider,
          name: r'userProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
          dependencies: UserFamily._dependencies,
          allTransitiveDependencies: UserFamily._allTransitiveDependencies,
          id: id,
          age: age,
          userName: userName,
        );

  UserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.age,
    required this.userName,
  }) : super.internal();

  final int id;
  final int age;
  final String? userName;

  @override
  Override overrideWith(
    User Function(UserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserProvider._internal(
        (ref) => create(ref as UserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        age: age,
        userName: userName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<User> createElement() {
    return _UserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProvider &&
        other.id == id &&
        other.age == age &&
        other.userName == userName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, age.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserRef on AutoDisposeProviderRef<User> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `age` of this provider.
  int get age;

  /// The parameter `userName` of this provider.
  String? get userName;
}

class _UserProviderElement extends AutoDisposeProviderElement<User>
    with UserRef {
  _UserProviderElement(super.provider);

  @override
  int get id => (origin as UserProvider).id;
  @override
  int get age => (origin as UserProvider).age;
  @override
  String? get userName => (origin as UserProvider).userName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
