import 'package:absolute_stay_site/app/sections/Animated_dialogue/login_options.dart';
import 'package:absolute_stay_site/app/utils/CustomDialog.dart';
import 'package:absolute_stay_site/app/utils/navbar_utils.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:absolute_stay_site/usable/core/providers/drawer_provider.dart';
import 'package:absolute_stay_site/usable/core/res/responsive.dart';
import 'package:absolute_stay_site/usable/widgets/navbar_actions_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../usable/widgets/navbar_logo.dart';

class NavbarWeb extends StatefulWidget {
  const NavbarWeb({super.key});

  @override
  State<NavbarWeb> createState() => _NavbarWebState();
}


class _NavbarWebState extends State<NavbarWeb> {
  bool isHover = false;
  bool isDialogVisible = false; // Added to control dialog visibility

  void _showAnimatedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CustomDialog(); // Use the CustomDialog widget
      },
    );
  }

  void _hideDialog() {
    setState(() {
      isDialogVisible = false; // Hide the dialog
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: bgColor,
      child: Stack( // Use a Stack to overlay the dialog
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60.w / 12),
            child: Row(
              children: [
                const NavBarLogo(),
                const Expanded(child: SizedBox()),
                ...NavBarUtils.names.asMap().entries.map((e) => NavBarActionButton(
                    label: e.value, index: e.key)),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  transform: Matrix4.translationValues(0, isHover ? -15 : 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isHover ? secondaryColor : primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: InkWell(
                      onHover: (value) {
                        setState(() {
                          isHover = value;
                        });
                      },
                      onTap: () {
                        _showAnimatedDialog(context);
                      },
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        child: Text(
                          'Join',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isDialogVisible) // Display the dialog when isDialogVisible is true
            Positioned.fill(
              child: GestureDetector(
                onTap: _hideDialog,
                child: Container(
                  color: Colors.black.withOpacity(0.5), // Add a semi-transparent background
                  child: const LoginOptions(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class NavbarTablet extends StatefulWidget {
  const NavbarTablet({super.key});

  @override
  State<NavbarTablet> createState() => _NavbarTabletState();
}

class _NavbarTabletState extends State<NavbarTablet> {
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    return Container(
      color: bgColor,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isTablet(context)?10.w:10,vertical: 10),
      child: Row(
        children: [
          IconButton(onPressed: (){
            drawerProvider.key.currentState!.openDrawer();
          },
              icon: const Icon(Icons.menu)
          ),
          const Expanded(child: SizedBox()),
          const NavBarLogo(),
        ],
      ),
    );
  }
}

