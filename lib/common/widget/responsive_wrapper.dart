import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveBreakPointWrapper extends StatelessWidget {
  final Widget child;
  const ResponsiveBreakPointWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      child: ResponsiveViewWrapper(child: child),
      breakpoints: [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
    );
  }
}

class ResponsiveViewWrapper extends StatelessWidget {
  final Widget child;
  const ResponsiveViewWrapper({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaxWidthBox(
      maxWidth: 1200,
      background: Container(
        color: Theme.of(context).colorScheme.background,
      ),
      child: ResponsiveScaledBox(
        width: ResponsiveValue<double>(context, conditionalValues: [
          Condition.equals(name: MOBILE, value: 450),
          Condition.between(start: 800, end: 1100, value: 800),
          Condition.between(start: 1000, end: 1200, value: 1000),
        ]).value,
        child:
            BouncingScrollWrapper.builder(context, child, dragWithMouse: true),
      ),
    );
  }
}
