import 'package:auto_route/auto_route.dart';
import 'package:template/common/widget/v_action_text_form_field.dart';
import 'package:template/common/widget/v_appbar.dart';
import 'package:template/constants/padding_const.dart';
import 'package:template/features/auth/providers/auth_providers.dart';
import 'package:template/template.dart';

@RoutePage(
  deferredLoading: true,
)
class RegisterView extends ConsumerWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Scaffold(
        appBar: VAppbar(
          ctx: context,
          appBarColor: Theme.of(context).colorScheme.inversePrimary,
          child: const Center(
            child: Text(
              "Register",
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
              PConst.h16,
              VActionTextFormField.password(),
              PConst.h16,
              ElevatedButton(
                onPressed: () => ref
                    .read(authenticationProvider.notifier)
                    .login("email", "password"),
                child: const Center(
                  child: Text(
                    "Daftar",
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Sudah Punya Akun? Masuk",
                ),
              )
            ],
          ),
        ));
  }
}
