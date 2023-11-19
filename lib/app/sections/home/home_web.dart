import 'package:absolute_stay_site/app/changes/strings.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'animated_count.dart';
import 'animated_text_kit.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({super.key});

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 100.h,
      child: Stack(
        children: [
          SizedBox(
            width: 60.w,
            child: Padding(
              padding: EdgeInsets.only(
                  top: screenwidth< 1200 ? 30.h :50.h ,left: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(hellotag,style: const TextStyle(
                    fontSize: 28,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 4.h,),
                  Text(description,style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),),
                  SizedBox(height: 3.h,),
                  Row(
                    children: [
                      const Text('A',style: TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),),
                      AnimatedTextKit(
                        isRepeatingAnimation: true,
                        repeatForever: true,
                        animatedTexts: webList,
                      ),
                    ],
                  ),
                  SizedBox(height: 1.5.h,),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Text(miniDescription,style: TextStyle(
                      fontSize: 18,
                      color: textColor.withOpacity(0.6),
                      fontWeight: FontWeight.w400,
                    ),),
                  ),
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
                ],
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: screenwidth - 42.w,
              child: SizedBox(
                height: 80.h,
                  child: Image.asset('assets/imgs/home.png',
                    fit: BoxFit.cover,
                  )),
              ),
        ],
      ),
    );
  }
}
