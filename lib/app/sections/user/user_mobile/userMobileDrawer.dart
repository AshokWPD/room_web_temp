import 'package:absolute_stay_site/app/sections/about/about.dart';
import 'package:absolute_stay_site/app/sections/main/main_section.dart';
import 'package:absolute_stay_site/app/sections/main/property/property_mobile/PropertyListingPage.dart';
import 'package:absolute_stay_site/app/sections/main/property/propertylist.dart';
import 'package:absolute_stay_site/app/sections/user/user_mobile/bookingHistory.dart';
import 'package:absolute_stay_site/app/sections/user/user_web/UserCustomdialogue.dart';
import 'package:absolute_stay_site/app/sections/user/user_web/user_navbar_utils.dart';
import 'package:absolute_stay_site/app/utils/CustomDialog.dart';
import 'package:absolute_stay_site/app/utils/navbar_utils.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../usable/widgets/navbar_logo.dart';
import 'favorites.dart';

class UserMobileDrawer extends StatefulWidget {
  const UserMobileDrawer({super.key});

  @override
  State<UserMobileDrawer> createState() => _UserMobileDrawerState();
}

class _UserMobileDrawerState extends State<UserMobileDrawer> {
  bool onTap = false;
  bool isDialogVisible = false; // Added to control dialog visibility

  void _showAnimatedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const UserCustomDialog(); // Use the CustomDialog widget
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding:  EdgeInsets.only(top: 2.h),
          child: Column(
            children: [
              const Center(
                child: NavBarLogo(),
              ),
              const Divider(),
              ...UserNavBarUtils.dnames.asMap().entries.map((e) =>
                  MaterialButton(onPressed: () {
                    // Navigate to the corresponding page based on the selected item
                    switch (e.key) {
                      case 1:
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BookingHistoryPage()));
                         break;
                      case 2:
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FavoritesPage()));
                         break;
                      case 0:
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PropertyList()));
                        break;
                     case 3:
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainPage()));
                       break;
                    }
                  },
                      child:ListTile(
                        leading: Icon(UserNavBarUtils.icons[e.key],color: Colors.black,),
                        title: Text(e.value),
                      )
                  ),
              ),
              SizedBox(height: 5.h,),
              InkWell(
                onTap: (){
                  _showAnimatedDialog(context);
                },
                  child:Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: onTap ? secondaryColor : primaryColor,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      const Text('Profile',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: primaryColor
                        ),
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
