// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:template/core/router/router.gr.dart';
import 'package:template/features/auth/providers/auth_providers.dart';
import 'package:template/template.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig(replaceInRouteName: 'Page|Screen|View,Route')
class AppRouter extends $AppRouter implements AutoRouteGuard {
  final Ref ref;
  AppRouter({
    required this.ref,
  });
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: SplashRoute.page,
      path: '/splash',
      initial: true,
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),
    AutoRoute(
      page: RegisterRoute.page,
      path: '/register',
    ),
    AutoRoute(
      page: UserRoute.page,
      path: '/user',
    ),
    AutoRoute(
      page: ForgetPasswordRoute.page,
      path: '/forget_password',
    ),
    AutoRoute(
      page: ChangePasswordRoute.page,
      path: '/change_password',
    ),
  ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // if (ref.read(authenticationProvider).){
    // //   resolver.resolveNext(true, reevaluateNext: true);
    // // } else {
    // //   router.replace(const LoginRoute());
    // }
    resolver.resolveNext(true, reevaluateNext: true);
  }
}
