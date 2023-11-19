import 'package:absolute_stay_site/app/changes/links.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterMobile extends StatefulWidget {
  const FooterMobile({super.key});

  @override
  State<FooterMobile> createState() => _FooterMobileState();
}

class _FooterMobileState extends State<FooterMobile> {
  List<bool>isHovered = List.generate(4, (index) => false);
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Container(
      height: 40.h,
      width: 100.w,
      color: textColor,
      child: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FooterIcon(0,'assets/icons/instagram.png'),
                    SizedBox(width: 3.w,),
                    FooterIcon(1,'assets/icons/facebook.png'),
                    SizedBox(width: 3.w,),
                    FooterIcon(2,'assets/icons/twitter.png'),
                    SizedBox(width: 3.w,),
                    FooterIcon(3,'assets/icons/playstore.png'),
                  ],
                ),
                SizedBox(height: 2.h,),
                InkWell(
                  // Navigate to Terms & Conditions page when tapped
                  onTap: () {
                    launch(termsAndConditionsURL);
                  },
                  child: const Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'josefinsans',
                    ),
                  ),
                ),
                SizedBox(height: 1.h,),
                InkWell(
                  // Navigate to Cookie Policy page when tapped
                  onTap: () {
                    launch(cookiePolicyURL);
                  },
                  child: const Text(
                    'Cookie Policy for Website',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'josefinsans',
                    ),
                  ),
                ),
                SizedBox(height: 1.h,),
                InkWell(
                  // Navigate to Privacy Policy page when tapped
                  onTap: () {
                    launch(privacyPolicyURL);
                  },
                  child: const Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'josefinsans',
                    ),
                  ),
                ),
                SizedBox(height: 1.h,),
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                SizedBox(height: 1.h,),
                const Text('Copyright © 2020.Absolute Stays. All rights reserved.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'josefinsans'
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  FooterIcon(int index,String img){
    return AnimatedContainer(
      height: 4.h,
      width: 4.h,
      duration: const Duration(milliseconds: 300),
      transform: Matrix4.translationValues(0, isHovered[index] ? -15 : 0, 0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isHovered[index] ? secondaryColor : Colors.white,
      ),
      child: InkWell(
        onHover: (value){
          setState(() {
            isHovered[index] = value;
          });
        },
        onTap: (){
          switch(index){
            case 0:
              launch(instagram);
              break;
            case 1:
              launch(facebook);
              break;
            case 2:
              launch(twitter);
              break;
            // case 3:
            //   launch(twitter);
            //   break;
          }
        },
        child: Image.asset(img),
      ),
    );
  }
}
