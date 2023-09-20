import 'package:auto_route/auto_route.dart';
import 'package:template/template.dart';

class AuthGuard extends AutoRouteGuard {
  final Ref ref;

  AuthGuard(this.ref);

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {}
}
