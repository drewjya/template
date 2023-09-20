import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/app/app.dart';
import 'package:template/core/local_storage/preferences/shared_pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final authService = AuthService();
  runApp(ProviderScope(
    overrides: [
      preferencesProvider.overrideWith((ref) => sharedPreferences),
      authServiceProvider.overrideWith((ref) => authService),
    ],
    child: App(authService: authService),
  ));
}
