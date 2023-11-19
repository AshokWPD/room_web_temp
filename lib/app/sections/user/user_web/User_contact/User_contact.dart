import 'package:absolute_stay_site/usable/core/res/responsive.dart';
import 'package:flutter/material.dart';
import 'User_contact_mobile.dart';
import 'User_contact_tab.dart';
import 'User_contact_web.dart';

class UserContact extends StatelessWidget {
  const UserContact({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: UserContactMobile(),
      tablet: UserContactTab(),
      web: UserContactWeb(),);
  }
}
