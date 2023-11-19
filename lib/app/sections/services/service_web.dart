import 'package:absolute_stay_site/app/utils/services_utils.dart';
import 'package:absolute_stay_site/usable/core/animations/entrance_fader.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ServiceWeb extends StatefulWidget {
  const ServiceWeb({super.key});

  @override
  State<ServiceWeb> createState() => _ServiceWebState();
}

class _ServiceWebState extends State<ServiceWeb> {
  List<bool> isHovered = List.generate(ServicesUtilsList.length, (index) => false);
  late double screenWidth;
  @override
  Widget build(BuildContext context) {
    screenWidth=MediaQuery.of(context).size.width;
    return Container(
      width: 100.w,
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Column(
          children: [
            const Text(
              'For Everyone',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'josefinsans',
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 100.h,
              width: 100.w,
              child: EntranceFader(
                offset: const Offset(0, 0),
                delay: const Duration(seconds: 0),
                duration: const Duration(milliseconds: 800),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 35.h,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 40,
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 5.w, top: 8.h),
                            child: ServiceCard(index),
                          );
                        },
                        childCount: ServicesUtilsList.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ServiceCard(int index) {
    final service = ServicesUtilsList[index];
    return Container(
      width: 100.w,
      height: 100.w,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: bgColor,
            spreadRadius: 60,
            blurRadius: 70,
            offset: Offset(10, 50),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 10.w,
            height: 5.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.translationValues(0, isHovered[index] ? -20 : 0, 0),
              child: InkWell(
                onHover: (value) {
                  setState(() {
                    isHovered[index] = value;
                  });
                },
                onTap: () {
                  // Add the action you want to perform when the icon is tapped.
                },
                child: Icon(
                  service.icon, // Access the icon from ServicesUtils
                  size: 40, // You can adjust the size as needed
                ),
              ),
            ),
          ),
          SizedBox(width: 2.w,),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(service.title,
              style: TextStyle(
                color: textColor,
                fontFamily: 'josefinsans',
                fontSize: screenWidth < 1200?20:30,
                fontWeight: FontWeight.w600,
              ),
              ),
              SizedBox(width: 2.w,height: 5.h,),
              SizedBox(
                width: double.infinity, // You can set a specific width here
                child: Text(
                  service.content ?? '', // If service.content is null, use an empty string as a default
                  style: TextStyle(
                    color: textColor.withOpacity(0.6),
                    fontFamily: 'josefinsans',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis, // Add this line
                  maxLines: 3, // Add this line to limit to 3 lines
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

