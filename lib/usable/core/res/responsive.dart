import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget web;
  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.web,
  }) : super(key: key);

  // screen sizes
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 500;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1050 &&
      MediaQuery.of(context).size.width >= 600;

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1050;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if (width >= 1050) {
      return web;
    } else if (width < 1050 && width >= 600) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
