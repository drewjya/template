// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_pref.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$preferencesHash() => r'8db551367efd8284173ebfc9ff48f9a145f9bbb9';

/// See also [preferences].
@ProviderFor(preferences)
final preferencesProvider = Provider<SharedPreferences>.internal(
  preferences,
  name: r'preferencesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$preferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PreferencesRef = ProviderRef<SharedPreferences>;
String _$prefHelperHash() => r'd6d673d9d922fb896990940bb91ce14971fa948a';

/// See also [prefHelper].
@ProviderFor(prefHelper)
final prefHelperProvider = AutoDisposeProvider<PrefHelper>.internal(
  prefHelper,
  name: r'prefHelperProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$prefHelperHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PrefHelperRef = AutoDisposeProviderRef<PrefHelper>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
