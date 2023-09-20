import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:template/app/app.dart';
import 'package:template/core/router/router.gr.dart';
import 'package:template/template.dart';

@RoutePage(
  deferredLoading: true,
)
class SplashView extends HookConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          ref.read(autoRouteProvider).replace(const UserRoute());
        },
      );
      return;
    }, []);
    return const Scaffold(
      body: Center(child: Text('Splash Page')),
    );
  }
}
