import 'package:absolute_stay_site/app/sections/contact/contact.dart';
import 'package:absolute_stay_site/app/sections/footer/footer.dart';
import 'package:absolute_stay_site/app/sections/home/home.dart';
import 'package:absolute_stay_site/app/sections/services/services.dart';
import 'package:absolute_stay_site/usable/core/providers/scroll_provider.dart';
import 'package:flutter/material.dart';

import 'User_contact/User_contact.dart';

class UserBodyUtils {
  static List<Widget> views(ScrollProvider scrollProvider) {
    return [
      const Home(),
      const Services(),
      const UserContact(),
      const Footer(),
    ];
  }
}
