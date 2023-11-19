import 'package:absolute_stay_site/app/changes/strings.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'animated_count.dart';
import 'animated_text_kit.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 15.h ,right:10.w ,left: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(hellotag,style: const TextStyle(
            fontSize: 22,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 4.h,),
          Text(description,style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
          ),),
          SizedBox(height: 3.h,),
          Row(
            children: [
              const Text('A',style: TextStyle(
                fontSize: 16,
                color: secondaryColor,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),),
              AnimatedTextKit(
                isRepeatingAnimation: true,
                repeatForever: true,
                animatedTexts: tabList,
              ),
            ],
          ),
          SizedBox(height: 1.5.h,),
          Text(miniDescription,style: TextStyle(
            fontSize: 16,
            color: textColor.withOpacity(0.6),
            fontWeight: FontWeight.w100,
          ),),
          SizedBox(height: 4.h,),
          Padding(
            padding:EdgeInsets.only(right : 22.w),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(Icons.home, color: Colors.tealAccent),
                    SizedBox(width: 5),
                    CountDownText(),
                    Text(' + Residence',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(Icons.location_city, color: Colors.cyan),
                    SizedBox(width: 5),
                    CountDownText(),
                    Text(' + Cities',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(Icons.people, color: Colors.deepOrangeAccent),
                    SizedBox(width: 5),
                    CountDownText(),
                    Text(' + Customers',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h,),
          Center(
            child: Image.asset('assets/imgs/home.png',
              fit: BoxFit.cover,height: 50.h,width: 40.h,
            ),
          )
        ],
      ),
    );
  }
}
