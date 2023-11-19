import 'package:absolute_stay_site/app/sections/about/about.dart';
import 'package:absolute_stay_site/app/sections/main/property/property_mobile/PropertyListingPage.dart';
import 'package:absolute_stay_site/app/sections/main/property/propertylist.dart';
import 'package:absolute_stay_site/app/utils/CustomDialog.dart';
import 'package:absolute_stay_site/app/utils/navbar_utils.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../usable/widgets/navbar_logo.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({super.key});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  bool onTap = false;
  bool isDialogVisible = false; // Added to control dialog visibility

  void _showAnimatedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(); // Use the CustomDialog widget
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
              ...NavBarUtils.dnames.asMap().entries.map((e) =>
              MaterialButton(onPressed: () {
                // Navigate to the corresponding page based on the selected item
                switch (e.key) {
                  case 0:
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PropertyList()));
                    break;
                  case 1:
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AboutPage()));
                    break;
                }
              },
              child:ListTile(
                leading: Icon(NavBarUtils.icons[e.key],color: Colors.black,),
                title: Text(e.value),
              )
              ),
              ),
              SizedBox(height: 5.h,),
              InkWell(
                onTap: (){
                  _showAnimatedDialog(context);
                },
                child: Container(
                  height: 40,
                  width: 30.w,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    color: onTap ? secondaryColor : primaryColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Center(
                    child: Text('Join',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
