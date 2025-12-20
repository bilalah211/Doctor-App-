import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  static bool isMobile(context) => MediaQuery.of(context).size.width <= 650;

  static bool isTablet(context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(context) => MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    if (_size.width >= 1100) {
      return desktop;
    } else if (_size.width > 800 && _size.width < 1100) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
