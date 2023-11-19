import 'package:absolute_stay_site/app/sections/Sub_Vendor/sub_vendor_web/sub_vendor_profile.dart';
import 'package:absolute_stay_site/app/sections/Sub_Vendor/tenentListSub.dart';
import 'package:absolute_stay_site/app/sections/Sub_Vendor/vacantListSub.dart';
import 'package:absolute_stay_site/app/sections/about/about.dart';
import 'package:absolute_stay_site/app/sections/main/main_section.dart';
import 'package:absolute_stay_site/app/sections/owner/Owner_web/owner_profile_web.dart';
import 'package:absolute_stay_site/app/sections/owner/Owner_web/payment_notificationWeb.dart';
import 'package:absolute_stay_site/app/sections/owner/Owner_web/tenant_listWeb.dart';
import 'package:absolute_stay_site/app/sections/owner/Owner_web/vacant_listWeb.dart';
import 'package:absolute_stay_site/app/sections/user/user_mobile/user_profile.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../sub-vendor-mobile/sub_vendor_profile.dart';


class SubVendorHomeWeb extends StatefulWidget {
  const SubVendorHomeWeb({super.key});

  @override
  State<SubVendorHomeWeb> createState() => _SubVendorHomeWebState();
}

class _SubVendorHomeWebState extends State<SubVendorHomeWeb> {
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  final Map<String, IconData> menuIcons = {
    'Profile': Icons.account_circle,
    //'Add Sub-Vendor': Icons.person,
    //'adminServices': Icons.business,
    'Tenant List': Icons.people,
    //'My Property': Icons.apartment,
    'Manage Payment': Icons.payment,
    'Vacant List': Icons.home,
    //'Ticket list': Icons.receipt,
    'logout': Icons.exit_to_app,
  };

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  void _showAnimatedDialog(BuildContext context, var val) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: val,
        );
      },
    );
  }

  void _launchPhone(String phoneNumber) async {
    final Uri uri = Uri.parse('tel:$phoneNumber');
    if (!await launcher.launchUrl(uri)) {
      await launcher.launchUrl(uri);
    } else {
      debugPrint("Could not launch the phone app");
    }
  }



  void _launchEmail(String email) async {
    final Uri uri = Uri.parse('mailto:$email');
    if (!await launcher.launchUrl(uri)) {
      await launcher.launchUrl(uri);
    } else {
      debugPrint("Could not launch the email app");
    }
  }

  var casetex = 'Profile';

  Widget handleDrawerSelection(String value, BuildContext context) {
    switch (value) {
      case 'Tenant List':
      return TenantListPageSub();
        // return const TenantListPageWeb();

      case 'Manage Payment':
        return const PaymentNotificationPageWeb();

      // case 'Add Sub-Vendor':
      //   return const SubVendorPermissionWeb();

      // case 'adminServices':
      //   return const AdminServicesPageWeb();

      case 'Profile':
        return const UserProfileScreen();

      // case 'My Property':
      //   return const AddPropertyWeb();

      case 'Vacant List':
        return const VacantListPageSub();

      // case 'Ticket list':
      //   return const VendorTicketListPageweb();

      case 'About Us':
        return const AboutPage();

    //case 'logout':
    //   Navigator.pop(context); // Close the drawer if it's open
    //   //File_server.clearAllLDB(context);
    //   Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => const HomePage()),
    //     (Route<dynamic> route) => false,
    //   );
    //   // Perform logout action
    //   break;
      default:
        return const UserProfileScreen();
    // Handle other selections if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: 500, // Adjust the width as needed
                child: Drawer(
                  backgroundColor: bgColor,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: customColor,
                        ),
                        child: const Center(
                          child: Text(
                            'Welcome Sub-Vendor ! ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(menuIcons['Profile']),
                        title: const Text('Profile'),
                        onTap: () {
                          setState(() {
                            casetex = 'Profile';
                          });
                        },
                      ),
                      // ListTile(
                      //   leading: Icon(menuIcons['My Property']),
                      //   title: const Text('My Property'),
                      //   onTap: () {
                      //     setState(() {
                      //       casetex = 'My Property';
                      //     });
                      //   },
                      // ),
                      // ListTile(
                      //   leading: Icon(menuIcons['Add Sub-Vendor']),
                      //   title: const Text('Add Sub-Vendor'),
                      //   onTap: () {
                      //     _showAnimatedDialog(
                      //         context, const SubVendorPermissionWeb());
                      //   },
                      // ),
                      ListTile(
                        leading: Icon(menuIcons['Tenant List']),
                        title: const Text('List of the Tenants'),
                        onTap: () {
                          setState(() {
                            casetex = 'Tenant List';
                          });
                        },
                      ),
                      ListTile(
                        leading: Icon(menuIcons['Manage Payment']),
                        title: const Text('Manage Payment'),
                        onTap: () {
                          setState(() {
                            casetex = 'Manage Payment';
                          });
                        },
                      ),
                      ListTile(
                        leading: Icon(menuIcons['Vacant List']),
                        title: const Text('Vacant List'),
                        onTap: () {
                          setState(() {
                            casetex = 'Vacant List';
                          });
                        },
                      ),
                      // ListTile(
                      //   leading: Icon(menuIcons['Ticket list']),
                      //   title: const Text('Tenant Raised Tickets'),
                      //   onTap: () {
                      //     setState(() {
                      //       casetex = 'Ticket list';
                      //     });
                      //   },
                      // ),
                      // ListTile(
                      //   leading: Icon(menuIcons['adminServices']),
                      //   title: const Text('Services Provided by Admin'),
                      //   onTap: () {
                      //     setState(() {
                      //       casetex = 'adminServices';
                      //     });
                      //   },
                      // ),
                      ListTile(
                        leading: const Icon(Icons.info),
                        title: const Text('About Us'),
                        onTap: () {
                          setState(() {
                            casetex = 'About Us';
                          });
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.phone),
                        title: const Text('+91 7845745809'),
                        onTap: () => _launchPhone('+917845745809'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: const Text('helpdesk@absolutestay.co.in'),
                        onTap: () =>
                            _launchEmail('helpdesk@absolutestay.co.in'),
                      ),
                      ListTile(
                        leading: Icon(menuIcons['logout']),
                        title: const Text('Logout'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainPage()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: handleDrawerSelection(casetex, context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
