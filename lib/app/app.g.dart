// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autoRouteHash() => r'c3bd63756a926ee739d576751529c276f5bb5b2a';

/// See also [autoRoute].
@ProviderFor(autoRoute)
final autoRouteProvider = AutoDisposeProvider<AppRouter>.internal(
  autoRoute,
  name: r'autoRouteProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$autoRouteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AutoRouteRef = AutoDisposeProviderRef<AppRouter>;
String _$authServiceHash() => r'f71d4723e9e2265747ae5e66bef735f9c4ee1b08';

/// See also [AuthService].
@ProviderFor(AuthService)
final authServiceProvider = NotifierProvider<AuthService, bool>.internal(
  AuthService.new,
  name: r'authServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthService = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
