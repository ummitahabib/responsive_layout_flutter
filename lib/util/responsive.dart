import 'package:flutter/material.dart';
import 'package:flutter_responsive_layout/util/sizes.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? desktopTablet;

  const Responsive({
    Key? key,
    this.mobile,
    this.tablet,
    this.desktop,
    this.desktopTablet,
  }) : super(key: key);

//size for tablet, mobile and desktop app
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < SizeConstants.size550;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < SizeConstants.size850 &&
      MediaQuery.of(context).size.width >= SizeConstants.size550;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= SizeConstants.size850;

  static double yHeight(BuildContext context, {double percent = 1}) =>
      MediaQuery.of(context).size.height * percent;
  static double xWidth(BuildContext context, {double percent = 1}) =>
      MediaQuery.of(context).size.width * percent;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= SizeConstants.size850) {
          return desktop ?? Container();
        }

        if (constraints.maxWidth >= SizeConstants.size550) {
          return tablet ?? Container();
        }

        return mobile ?? Container();
      },
    );
  }
}
