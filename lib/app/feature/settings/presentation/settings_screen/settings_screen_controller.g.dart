// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsScreenControllerHash() =>
    r'7b04ddc6f7b929b39551b9b7d5ff7324b86f2416';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
///
/// Copied from [SettingsScreenController].
@ProviderFor(SettingsScreenController)
final settingsScreenControllerProvider = AutoDisposeAsyncNotifierProvider<
    SettingsScreenController, ThemeMode>.internal(
  SettingsScreenController.new,
  name: r'settingsScreenControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsScreenControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SettingsScreenController = AutoDisposeAsyncNotifier<ThemeMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
