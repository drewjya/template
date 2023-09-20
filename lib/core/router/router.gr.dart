// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:template/app/view/splash_view.dart' deferred as _i5;
import 'package:template/features/auth/view/change_password_view.dart'
    deferred as _i1;
import 'package:template/features/auth/view/forget_password_view.dart'
    deferred as _i2;
import 'package:template/features/auth/view/login_view.dart' deferred as _i3;
import 'package:template/features/auth/view/register_view.dart' deferred as _i4;
import 'package:template/features/auth/view/user_view.dart' deferred as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    ChangePasswordRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.ChangePasswordView(),
        ),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.ForgetPasswordView(),
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.LoginView(),
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.RegisterView(),
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.SplashView(),
        ),
      );
    },
    UserRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.UserView(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ChangePasswordView]
class ChangePasswordRoute extends _i7.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ForgetPasswordView]
class ForgetPasswordRoute extends _i7.PageRouteInfo<void> {
  const ForgetPasswordRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ForgetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RegisterView]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashView]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.UserView]
class UserRoute extends _i7.PageRouteInfo<void> {
  const UserRoute({List<_i7.PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
