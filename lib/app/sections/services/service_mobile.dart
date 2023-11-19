import 'package:absolute_stay_site/app/utils/services_utils.dart';
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ServiceMobile extends StatefulWidget {
  const ServiceMobile({super.key});

  @override
  State<ServiceMobile> createState() => _ServiceMobileState();
}

class _ServiceMobileState extends State<ServiceMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.only(top: 5.h,left: 5.w,right: 5.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: const Column(
                children: [
                  Text(
                    'For Everyone',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'josefinsans',
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.h,),
            ...List.generate(4, (index) {
              return ServiceCard(index);
            }),
          ],
        ),
      ),
    );
  }
  Widget ServiceCard(int index){
    final service = ServicesUtilsList[index];
    return Container(
      padding: EdgeInsets.all(2.h),
      margin: EdgeInsets.only(bottom: 5.h),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 30.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: Icon(
              service.icon, // Access the icon from ServicesUtils
              size: 40, // You can adjust the size as needed
            ),
          ),
          SizedBox(height: 2.w,),
          Text(service.title,
            style: const TextStyle(
              color: textColor,
              fontFamily: 'josefinsans',
              fontSize: 20,
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
      ),
    );
  }
}
