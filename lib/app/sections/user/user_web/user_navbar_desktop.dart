import 'package:absolute_stay_site/app/sections/Animated_dialogue/login_options.dart';
import 'package:absolute_stay_site/app/sections/user/user_web/user_profile_web.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:absolute_stay_site/usable/core/providers/drawer_provider.dart';
import 'package:absolute_stay_site/usable/core/res/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../usable/widgets/navbar_logo.dart';
import 'UserCustomdialogue.dart';
import 'user_navbar_actions_button.dart';
import 'user_navbar_utils.dart';


class UserNavbarWeb extends StatefulWidget {
  const UserNavbarWeb({super.key});

  @override
  State<UserNavbarWeb> createState() => _UserNavbarWebState();
}


class _UserNavbarWebState extends State<UserNavbarWeb> {
  bool isHover = false;
  bool isDialogVisible = false; // Added to control dialog visibility

  void _showAnimatedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const UserCustomDialog(); // Use the CustomDialog widget
      },
    );
  }

  void _hideDialog() {
    setState(() {
      isDialogVisible = false; // Hide the dialog
    });}


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
                ...UserNavBarUtils.names.asMap().entries.map((e) => UserNavBarActionButton(
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
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.person, // Replace this with the profile icon of your choice
                          color: Colors.white,
                          size: 30, // Adjust the size as needed
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
                  child: const UserProfileWeb(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class UserNavbarTablet extends StatefulWidget {
  const UserNavbarTablet({super.key});

  @override
  State<UserNavbarTablet> createState() => _UserNavbarTabletState();
}

class _UserNavbarTabletState extends State<UserNavbarTablet> {
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

