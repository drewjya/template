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
class AuthService extends _$AuthService implements Listenable {
  VoidCallback? _listener;
  @override
  bool build() {
    _listener?.call();
    return false;
  }

  void loginAndVerify() {
    state = true;
  }

  @override
  void addListener(VoidCallback listener) {
    _listener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _listener = null;
  }
}

class App extends HookConsumerWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(autoRouteProvider).config(
            reevaluateListenable: ref.watch(authServiceProvider.notifier),
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
