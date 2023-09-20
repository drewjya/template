import 'package:auto_route/auto_route.dart';
import 'package:template/app/app.dart';
import 'package:template/common/widget/v_action_text_form_field.dart';
import 'package:template/common/widget/v_appbar.dart';
import 'package:template/constants/padding_const.dart';
import 'package:template/core/router/router.gr.dart';
import 'package:template/features/auth/providers/auth_providers.dart';
import 'package:template/template.dart';

@RoutePage(
  deferredLoading: true,
)
class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authenticationProvider, (previous, next) {
      switch (next) {
        case AsyncData(:final value):
          value.map(
            signedIn: (value) {
              ref.read(autoRouteProvider).replaceAll([const UserRoute()]);
            },
            signedOut: (value) {
              ref.read(autoRouteProvider).replaceAll([const LoginRoute()]);
            },
          );

        case AsyncLoading():
          showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
      }
    });

    return Scaffold(
        appBar: VAppbar(
          ctx: context,
          appBarColor: Theme.of(context).colorScheme.inversePrimary,
          child: const Center(
            child: Text(
              "Login",
            ),
          ),
        ),
        // extendBodyBehindAppBar: true,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              VActionTextFormField.email(),
              PConst.h16,
              VActionTextFormField.password(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => ref
                        .read(autoRouteProvider)
                        .push(const ForgetPasswordRoute()),
                    child: Text(
                      "Lupa Password ?",
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(authenticationProvider.notifier)
                      .login("My Email", "some-updated-secret-auth-token");
                },
                child: const Center(
                  child: Text(
                    "Login",
                  ),
                ),
              ),
              TextButton(
                onPressed: () =>
                    ref.read(autoRouteProvider).replace(const RegisterRoute()),
                child: Text(
                  "Belum Punya Akun? Daftar",
                ),
              )
            ],
          ),
        ));
  }
}
