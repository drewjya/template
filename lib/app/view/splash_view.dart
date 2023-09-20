import 'package:auto_route/auto_route.dart';
import 'package:template/app/app.dart';
import 'package:template/core/router/router.gr.dart';
import 'package:template/features/auth/providers/auth_providers.dart';
import 'package:template/template.dart';

@RoutePage(
  deferredLoading: true,
)
class SplashView extends HookConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authenticationProvider, (previous, next) {
      print("$next");
      switch (next) {
        case AsyncLoading():
          break;
        case AsyncData():
          ref.read(autoRouteProvider).replace(const UserRoute());
        case AsyncError():
          ref.read(autoRouteProvider).replace(const LoginRoute());
      }
    });

    return const Scaffold(
      body: Center(child: Text('Splash Page')),
    );
  }
}
