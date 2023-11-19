import 'package:absolute_stay_site/usable/core/res/responsive.dart';
import 'package:flutter/material.dart';
import 'home_mobile.dart';
import 'home_tab.dart';
import 'home_web.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: HomeMobile(),
        tablet: HomeTab(),
        web: HomeWeb());
  }
}
