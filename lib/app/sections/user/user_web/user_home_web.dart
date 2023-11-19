import 'package:absolute_stay_site/app/sections/main/widgets/mobile_drawer.dart';
import 'package:absolute_stay_site/app/sections/user/user_mobile/userMobileDrawer.dart';
import 'package:absolute_stay_site/usable/core/providers/drawer_provider.dart';
import 'package:absolute_stay_site/usable/core/res/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user_body.dart';
import 'user_navbar_desktop.dart';


class UserMainPage extends StatefulWidget {
  const UserMainPage({super.key});

  @override
  State<UserMainPage> createState() => _UserMainPageState();
}

class _UserMainPageState extends State<UserMainPage> {
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    return SafeArea(
      child: Scaffold(
        key: drawerProvider.key,
        extendBodyBehindAppBar: true,
        appBar:  const PreferredSize(preferredSize: Size.fromHeight(160),
            child: Responsive(
                mobile: UserNavbarTablet(),
                tablet: UserNavbarTablet(),
                web: UserNavbarWeb())),
        drawer: !Responsive.isWeb(context)? const UserMobileDrawer() : null,
        body:   const Stack(
            children:[
              UserBody(),
              //ArrowOnTop(),
            ]
        ),
      ),
    );
  }
}
