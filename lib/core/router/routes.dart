import 'package:template/app/view/splash_view.dart';
import 'package:template/features/auth/view/change_password_view.dart';
import 'package:template/features/auth/view/forget_password_view.dart';
import 'package:template/features/auth/view/login_view.dart';
import 'package:template/features/auth/view/register_view.dart';
import 'package:template/features/auth/view/user_view.dart';
import 'package:template/template.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  const SplashRoute();
  static const path = '/splash';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashView();
  }
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
class LoginRoute extends GoRouteData {
  const LoginRoute();
  static const path = '/login';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginView();
  }
}

@TypedGoRoute<UserRoute>(path: UserRoute.path)
class UserRoute extends GoRouteData {
  const UserRoute();
  static const path = '/user';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserView();
  }
}

@TypedGoRoute<ForgetPasswordRoute>(path: ForgetPasswordRoute.path)
class ForgetPasswordRoute extends GoRouteData {
  const ForgetPasswordRoute();
  static const path = '/forget_password';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ForgetPasswordView();
  }
}

@TypedGoRoute<ChangePasswordRoute>(path: ChangePasswordRoute.path)
class ChangePasswordRoute extends GoRouteData {
  const ChangePasswordRoute();
  static const path = '/forget_password';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ChangePasswordView();
  }
}

@TypedGoRoute<RegisterRoute>(path: RegisterRoute.path)
class RegisterRoute extends GoRouteData {
  const RegisterRoute();
  static const path = '/register';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RegisterView();
  }
}
