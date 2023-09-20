import 'package:auto_route/auto_route.dart';
import 'package:template/app/app.dart';
import 'package:template/core/router/router.gr.dart';
import 'package:template/template.dart';

class AuthGuard extends AutoRouteGuard {
  final Ref ref;

  AuthGuard(this.ref);

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    if (ref.read(authServiceProvider).isAuthenticated) {
      resolver.resolveNext(true, reevaluateNext: true);
    } else {
      router.replace(const LoginRoute());
    }
  }
}
