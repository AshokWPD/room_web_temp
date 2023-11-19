import 'package:absolute_stay_site/usable/core/res/responsive.dart';
import 'package:flutter/material.dart';

import 'sub-vendor-mobile/sub_vendor_homepage.dart';
import 'sub_vendor_web/subVendorHome.dart';

class SubVendor extends StatelessWidget {
  const SubVendor({super.key});

  @override
  Widget build(BuildContext context) {
    return  Responsive(
        mobile: SubVendorHomePage(),
        tablet: SubVendorHomePage(),
        web: const SubVendorHomeWeb());
  }
}
