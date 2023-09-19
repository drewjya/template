// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:template/template.dart';

class VStatusBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final Color? color;
  const VStatusBar({
    Key? key,
    required this.context,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      width: MediaQuery.sizeOf(context).width,
      color: color,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MediaQuery.paddingOf(context).top);
}
