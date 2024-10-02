// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_up_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$startUpHash() => r'2b0ee3945e812f789220166ac7b274919264412a';

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

/// See also [startUp].
@ProviderFor(startUp)
const startUpProvider = StartUpFamily();

/// See also [startUp].
class StartUpFamily extends Family<AsyncValue<void>> {
  /// See also [startUp].
  const StartUpFamily();

  /// See also [startUp].
  StartUpProvider call({
    required String flavour,
  }) {
    return StartUpProvider(
      flavour: flavour,
    );
  }

  @override
  StartUpProvider getProviderOverride(
    covariant StartUpProvider provider,
  ) {
    return call(
      flavour: provider.flavour,
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
  String? get name => r'startUpProvider';
}

/// See also [startUp].
class StartUpProvider extends FutureProvider<void> {
  /// See also [startUp].
  StartUpProvider({
    required String flavour,
  }) : this._internal(
          (ref) => startUp(
            ref as StartUpRef,
            flavour: flavour,
          ),
          from: startUpProvider,
          name: r'startUpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$startUpHash,
          dependencies: StartUpFamily._dependencies,
          allTransitiveDependencies: StartUpFamily._allTransitiveDependencies,
          flavour: flavour,
        );

  StartUpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.flavour,
  }) : super.internal();

  final String flavour;

  @override
  Override overrideWith(
    FutureOr<void> Function(StartUpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StartUpProvider._internal(
        (ref) => create(ref as StartUpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        flavour: flavour,
      ),
    );
  }

  @override
  FutureProviderElement<void> createElement() {
    return _StartUpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StartUpProvider && other.flavour == flavour;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, flavour.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StartUpRef on FutureProviderRef<void> {
  /// The parameter `flavour` of this provider.
  String get flavour;
}

class _StartUpProviderElement extends FutureProviderElement<void>
    with StartUpRef {
  _StartUpProviderElement(super.provider);

  @override
  String get flavour => (origin as StartUpProvider).flavour;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
