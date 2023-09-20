// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:template/common/widget/responsive_wrapper.dart';
import 'package:template/core/router/auto_route_observer.dart';
import 'package:template/core/router/router.dart';
import 'package:template/template.dart';

part 'app.g.dart';

final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@riverpod
Raw<AppRouter> autoRoute(AutoRouteRef ref) {
  return AppRouter(ref: ref);
}

@Riverpod(keepAlive: true)
Raw<AuthService> authService(AuthServiceRef ref) {
  throw UnimplementedError();
}

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  bool _isVerified = false;

  bool get isVerified => _isVerified;

  set isVerified(bool value) {
    _isVerified = value;
    notifyListeners();
  }

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    if (!_isAuthenticated) {
      _isVerified = false;
    }
    notifyListeners();
  }

  void loginAndVerify() {
    _isAuthenticated = true;
    _isVerified = true;
    notifyListeners();
  }
}

class App extends HookConsumerWidget {
  final AuthService authService;
  const App({
    super.key,
    required this.authService,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(autoRouteProvider).config(
            reevaluateListenable: authService,
            navigatorObservers: () => [
              RouterObserver(),
            ],
          ),
      title: 'template',
      theme: _buildTheme(),
      builder: (context, child) =>
          ResponsiveBreakPointWrapper(child: child ?? const SizedBox()),
    );
  }
}

ThemeData _buildTheme() {
  var baseTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    useMaterial3: true,
  );
  return baseTheme.copyWith(
    textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
    primaryTextTheme: GoogleFonts.latoTextTheme(baseTheme.primaryTextTheme),
  );
}
