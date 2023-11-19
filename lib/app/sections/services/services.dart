import 'package:absolute_stay_site/usable/core/res/responsive.dart';
import 'package:flutter/material.dart';
import 'service_mobile.dart';
import 'service_tab.dart';
import 'service_web.dart';


class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: ServiceMobile(),
        tablet: ServiceTab(),
        web: ServiceWeb(),);
  }
}
