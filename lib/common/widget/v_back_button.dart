import 'package:flutter/foundation.dart';
import 'package:template/template.dart';

abstract class _ActionButton extends StatelessWidget {
  /// Creates a Material Design icon button.
  const _ActionButton({
    super.key,
    this.color,
    required this.icon,
    required this.onPressed,
    this.style,
  });

  /// The icon to display inside the button.
  final Widget icon;

  /// The callback that is called when the button is tapped
  /// or otherwise activated.
  ///
  /// If this is set to null, the button will do a default action
  /// when it is tapped or activated.
  final VoidCallback? onPressed;

  /// The color to use for the icon.
  ///
  /// Defaults to the [IconThemeData.color] specified in the ambient [IconTheme],
  /// which usually matches the ambient [Theme]'s [ThemeData.iconTheme].
  final Color? color;

  /// Customizes this icon button's appearance.
  ///
  /// The [style] is only used for Material 3 [IconButton]s. If [ThemeData.useMaterial3]
  /// is set to true, [style] is preferred for icon button customization, and any
  /// parameters defined in [style] will override the same parameters in [IconButton].
  ///
  /// Null by default.
  final ButtonStyle? style;

  /// This returns the appropriate tooltip text for this action button.
  String _getTooltip(BuildContext context);

  /// This is the default function that is called when [onPressed] is set
  /// to null.
  void _onPressedCallback(BuildContext context);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return IconButton(
      icon: icon,
      style: style,
      color: color,
      tooltip: _getTooltip(context),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          _onPressedCallback(context);
        }
      },
    );
  }
}

typedef _ActionIconBuilderCallback = WidgetBuilder? Function(
    ActionIconThemeData? actionIconTheme);
typedef _ActionIconDataCallback = IconData Function(BuildContext context);
typedef _AndroidSemanticsLabelCallback = String Function(
    MaterialLocalizations materialLocalization);

class _ActionIcon extends StatelessWidget {
  const _ActionIcon({
    required this.iconBuilderCallback,
    required this.getIcon,
    required this.getAndroidSemanticsLabel,
  });

  final _ActionIconBuilderCallback iconBuilderCallback;
  final _ActionIconDataCallback getIcon;
  final _AndroidSemanticsLabelCallback getAndroidSemanticsLabel;

  @override
  Widget build(BuildContext context) {
    final ActionIconThemeData? actionIconTheme = ActionIconTheme.of(context);
    final WidgetBuilder? iconBuilder = iconBuilderCallback(actionIconTheme);
    if (iconBuilder != null) {
      return iconBuilder(context);
    }

    final IconData data = getIcon(context);
    final String? semanticsLabel;
    // This can't use the platform from Theme because it is the Android OS that
    // expects the duplicated tooltip and label.
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        semanticsLabel =
            getAndroidSemanticsLabel(MaterialLocalizations.of(context));
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        semanticsLabel = null;
    }

    return Icon(data, semanticLabel: semanticsLabel);
  }
}

/// A "back" icon that's appropriate for the current [TargetPlatform].
///
/// The current platform is determined by querying for the ambient [Theme].
///
/// See also:
///
///  * [VBackButton], an [IconButton] with a [VBackButtonIcon] that calls
///    [Navigator.maybePop] to return to the previous route.
///  * [IconButton], which is a more general widget for creating buttons
///    with icons.
///  * [Icon], a Material Design icon.
///  * [ThemeData.platform], which specifies the current platform.
class VBackButtonIcon extends StatelessWidget {
  /// Creates an icon that shows the appropriate "back" image for
  /// the current platform (as obtained from the [Theme]).
  const VBackButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return _ActionIcon(
      iconBuilderCallback: (ActionIconThemeData? actionIconTheme) {
        return actionIconTheme?.backButtonIconBuilder;
      },
      getIcon: (BuildContext context) {
        if (kIsWeb) {
          // Always use 'Icons.arrow_back' as a back_button icon in web.
          return Icons.arrow_back;
        }
        switch (Theme.of(context).platform) {
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
          case TargetPlatform.linux:
          case TargetPlatform.windows:
          case TargetPlatform.iOS:
          case TargetPlatform.macOS:
            return Icons.arrow_back_ios_new;
        }
      },
      getAndroidSemanticsLabel: (MaterialLocalizations materialLocalization) {
        return materialLocalization.backButtonTooltip;
      },
    );
  }
}

/// A Material Design back icon button.
///
/// A [VBackButton] is an [IconButton] with a "back" icon appropriate for the
/// current [TargetPlatform]. When pressed, the back button calls
/// [Navigator.maybePop] to return to the previous route unless a custom
/// [onPressed] callback is provided.
///
/// The [onPressed] callback can, for instance, be used to pop the platform's navigation stack
/// via [SystemNavigator] instead of Flutter's [Navigator] in add-to-app
/// situations.
///
/// In Material Design 3, both [style]'s [ButtonStyle.iconColor] and [color] are
/// used to override the default icon color of [VBackButton]. If both exist, the [ButtonStyle.iconColor]
/// will override [color] for states where [ButtonStyle.foregroundColor] resolves to non-null.
///
/// When deciding to display a [VBackButton], consider using
/// `ModalRoute.of(context)?.canPop` to check whether the current route can be
/// popped. If that value is false (e.g., because the current route is the
/// initial route), the [VBackButton] will not have any effect when pressed,
/// which could frustrate the user.
///
/// Requires one of its ancestors to be a [Material] widget.
///
/// See also:
///
///  * [AppBar], which automatically uses a [VBackButton] in its
///    [AppBar.leading] slot when the [Scaffold] has no [Drawer] and the
///    current [Route] is not the [Navigator]'s first route.
///  * [VBackButtonIcon], which is useful if you need to create a back button
///    that responds differently to being pressed.
///  * [IconButton], which is a more general widget for creating buttons with
///    icons.
///  * [CloseButton], an alternative which may be more appropriate for leaf
///    node pages in the navigation tree.
class VBackButton extends _ActionButton {
  /// Creates an [IconButton] with the appropriate "back" icon for the current
  /// target platform.
  const VBackButton({
    super.key,
    super.color,
    super.style,
    super.onPressed,
  }) : super(icon: const VBackButtonIcon());

  @override
  void _onPressedCallback(BuildContext context) => Navigator.maybePop(context);

  @override
  String _getTooltip(BuildContext context) {
    return MaterialLocalizations.of(context).backButtonTooltip;
  }
}
