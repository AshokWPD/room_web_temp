import 'package:absolute_stay_site/usable/core/providers/drawer_provider.dart';
import 'package:absolute_stay_site/usable/core/res/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/_navbar_desktop.dart';
import 'widgets/body.dart';
import 'widgets/mobile_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    return SafeArea(
      child: Scaffold(
        key: drawerProvider.key,
        extendBodyBehindAppBar: true,
        appBar: const PreferredSize(preferredSize: Size.fromHeight(160),
            child: Responsive(
                mobile: NavbarTablet(),
                tablet: NavbarTablet(),
                web: NavbarWeb())),
        drawer: !Responsive.isWeb(context)? const MobileDrawer() : null,
        body:  const Stack(
          children:[
            Body(),
            //ArrowOnTop(),
          ]
        ),
    ),
    );
  }
}
