import 'package:template/common/widget/v_action_text_form_field.dart';
import 'package:template/common/widget/v_appbar.dart';
import 'package:template/common/widget/v_back_button.dart';
import 'package:template/constants/padding_const.dart';
import 'package:template/template.dart';

class ChangePasswordView extends HookConsumerWidget {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: VAppbar(
        ctx: context,
        child: Padding(
          padding: PConst.ph8.pHor(16),
          child: const Row(
            children: [
              VBackButton(),
              Expanded(child: Center(child: Text("Change Password"))),
              AbsorbPointer(
                child: BackButton(
                  onPressed: null,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: PConst.ph8.pHor(16).pVer(16),
        child: Column(
          children: [
            VActionTextFormField.password(),
            PConst.h16,
            VActionTextFormField.password(labelText: "Konfirmasi Password"),
            PConst.h16,
            ElevatedButton(
              onPressed: () {},
              child: const Center(
                child: Text(
                  "Send",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
