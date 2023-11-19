import 'package:absolute_stay_site/usable/core/res/responsive.dart';
import 'package:flutter/material.dart';
import 'user_web/user_home_web.dart';

class Userpage extends StatelessWidget {
  const Userpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: UserMainPage(),
        tablet: UserMainPage(),
        web: UserMainPage());
  }
}
