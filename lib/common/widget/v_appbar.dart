// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:template/common/widget/v_statusbar.dart';
import 'package:template/template.dart';

class VAppbar extends StatelessWidget implements PreferredSizeWidget {
  const VAppbar({
    Key? key,
    this.textStyle,
    this.statusBarColor,
    this.appBarColor,
    required this.child,
    this.appBarHeight,
    required this.ctx,
  }) : super(key: key);

  final TextStyle? textStyle;
  final Color? statusBarColor;
  final Color? appBarColor;
  final Widget child;
  final double? appBarHeight;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    final statusBar = MediaQuery.viewPaddingOf(context).top;
    final appBarTheme = _AppBarDefaultsM3(ctx, appBarHeight: appBarHeight);
    final titleTextStyle = textStyle ?? appBarTheme.titleTextStyle;

    return Container(
      height: (appBarHeight ?? kToolbarHeight) + statusBar,
      color: appBarColor,
      child: Column(
        children: [
          VStatusBar(
            context: context,
            color: statusBarColor ?? appBarColor,
          ),
          Expanded(
            child: DefaultTextStyle(
                style: (titleTextStyle ?? const TextStyle()).copyWith(
                  color: _textColorForBackground(
                      appBarColor ?? Theme.of(ctx).colorScheme.background),
                ),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                child: child),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      (appBarHeight ?? kToolbarHeight) + MediaQuery.viewPaddingOf(ctx).top);
}

Color _textColorForBackground(Color backgroundColor) {
  if (ThemeData.estimateBrightnessForColor(backgroundColor) ==
      Brightness.dark) {
    return Colors.white;
  }

  return Colors.black;
}

class _AppBarDefaultsM3 extends AppBarTheme {
  _AppBarDefaultsM3(this.context, {double? appBarHeight})
      : super(
          elevation: 0.0,
          scrolledUnderElevation: 3.0,
          titleSpacing: NavigationToolbar.kMiddleSpacing,
          toolbarHeight: appBarHeight ?? kToolbarHeight,
        );

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;
  late final TextTheme _textTheme = _theme.textTheme;

  @override
  Color? get backgroundColor => _colors.surface;

  @override
  Color? get foregroundColor => _colors.onSurface;

  @override
  Color? get shadowColor => Colors.transparent;

  @override
  Color? get surfaceTintColor => _colors.surfaceTint;

  @override
  IconThemeData? get iconTheme => IconThemeData(
        color: _colors.onSurface,
        size: 24.0,
      );

  @override
  IconThemeData? get actionsIconTheme => IconThemeData(
        color: _colors.onSurfaceVariant,
        size: 24.0,
      );

  @override
  TextStyle? get toolbarTextStyle => _textTheme.bodyMedium;

  @override
  TextStyle? get titleTextStyle => _textTheme.titleLarge;
}
