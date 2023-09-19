import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:template/common/widget/responsive_wrapper.dart';
import 'package:template/core/core.dart';
import 'package:template/template.dart';

part 'app.g.dart';

final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@riverpod
GoRouter router(RouterRef ref) {
  final notifier = ref.watch(routerListenableProvider.notifier);
  return GoRouter(
    navigatorKey: navigatorKey,
    refreshListenable: notifier,
    initialLocation: SplashRoute.path,
    debugLogDiagnostics: true,
    routes: $appRoutes,
    redirect: notifier.redirect,
  );
}

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
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
