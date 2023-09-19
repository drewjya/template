// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences preferences(PreferencesRef ref) {
  throw UnimplementedError();
}

class PrefHelper {
  final SharedPreferences _prefs;
  PrefHelper(
    this._prefs,
  );

  Future<bool> setBool(String key, bool value) async =>
      _prefs.setBool(key, value);
  bool getBool(String key, {bool defaultValue = false}) =>
      _prefs.getBool(key) ?? defaultValue;

  Future<bool> setString(String key, String value) async =>
      _prefs.setString(key, value);
  String getString(String key, {String defaultValue = ""}) =>
      _prefs.getString(key) ?? defaultValue;

  Future<bool> setInt(String key, int value) async => _prefs.setInt(key, value);
  int getInt(String key, {int defaultValue = 0}) =>
      _prefs.getInt(key) ?? defaultValue;

  Future<bool> setDouble(String key, double value) async =>
      _prefs.setDouble(key, value);
  double getDouble(String key, {double defaultValue = 0}) =>
      _prefs.getDouble(key) ?? defaultValue;

  Future<bool> setMap(String key, Map<String, dynamic> value) async =>
      _prefs.setString(key, jsonEncode(value));
  Map<String, dynamic> getMap(String key) =>
      jsonDecode(_prefs.getString(key) ?? "{}") as Map<String, dynamic>;
}

@riverpod
PrefHelper prefHelper(PrefHelperRef ref) {
  final prefs = ref.watch(preferencesProvider);
  return PrefHelper(prefs);
}
