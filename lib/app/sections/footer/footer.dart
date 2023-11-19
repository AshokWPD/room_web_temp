import 'package:absolute_stay_site/usable/core/res/responsive.dart';
import 'package:flutter/material.dart';

import 'footer_mobile.dart';
import 'footer_tab.dart';
import 'footer_web.dart';



class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: FooterMobile(),
        tablet: FooterTab(),
        web: FooterWeb());
  }
}
