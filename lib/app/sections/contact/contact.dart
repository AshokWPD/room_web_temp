import 'package:absolute_stay_site/app/sections/contact/contact_mobile.dart';
import 'package:absolute_stay_site/usable/core/res/responsive.dart';
import 'package:flutter/material.dart';
import 'contact_tab.dart';
import 'contact_web.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContactMobile(),
      tablet: ContactTab(),
      web: ContactWeb(),);
  }
}
