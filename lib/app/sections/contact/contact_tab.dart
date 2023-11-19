import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContactTab extends StatefulWidget {
  const ContactTab({super.key});

  @override
  State<ContactTab> createState() => _ContactTabState();
}

class _ContactTabState extends State<ContactTab> {
  bool isHover = false;
  List<bool>isTab = List.generate(6, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 5.h,bottom: 5.h,right: 4.w,left: 4.w),
      child: Column(
        children: [
          const Text('Contact',
            style: TextStyle(
              color: primaryColor,
              fontFamily: 'josefinsans',
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4.h,),
          const Text('Any Questions?Feel Free To Contact',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontFamily: 'josefinsans',
              fontSize:  30 ,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 2.h,),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.h,vertical: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: primaryColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 4.h,
                            width: 6.h,
                            decoration: const BoxDecoration(shape: BoxShape.circle,color: secondaryColor),
                            child: const Center(child: Icon(Icons.place_outlined,size: 15,
                              color: Colors.white,
                            ),),
                          ),
                          const SizedBox(width: 10,),
                          const Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Address',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'josefinsans',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text('10,Level 3, Akshaya HQ OMR Road, SH 49A, Chennai, India',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'josefinsans',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                      const SizedBox(height: 2,),
                      Row(
                        children: [
                          Container(
                            height: 4.h,
                            width: 5.h,
                            decoration: const BoxDecoration(shape: BoxShape.circle,color: secondaryColor),
                            child: const Center(child: Icon(Icons.phone,size: 15,
                              color: Colors.white,
                            ),),
                          ),
                          const SizedBox(width: 10,),
                          const Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Phone Number',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'josefinsans',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text('+91 7845745809',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'josefinsans',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Container(
                            height: 4.h,
                            width: 5.h,
                            decoration: const BoxDecoration(shape: BoxShape.circle,color: secondaryColor),
                            child: const Center(child: Icon(Icons.mail,size: 15,
                              color: Colors.white,
                            ),),
                          ),
                          const SizedBox(width: 10,),
                          const Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Mail ID',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'josefinsans',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text('helpdesk@absolutestay.co.in',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'josefinsans',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 2.w,),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: isTab[0] ? primaryColor : Colors.white),
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                  color: textColor.withOpacity(0.6),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                enabledBorder: InputBorder.none,
                              ),
                              onTap: (){
                                setState(() {
                                  for (int i =0; i< isTab.length; i++) {
                                    i == 0 ? isTab[0] = true : isTab[i] = false;
                                  }
                                });
                              },
                              onTapOutside: (event){
                                setState(() {
                                  isTab[0] = false;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w,),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: isTab[1] ? primaryColor : Colors.white),
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: textColor.withOpacity(0.6),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                enabledBorder: InputBorder.none,
                              ),
                              onTap: (){
                                setState(() {
                                  for (int i =0; i< isTab.length; i++) {
                                    i == 1 ? isTab[1] = true : isTab[i] = false;
                                  }
                                });
                              },
                              onTapOutside: (event){
                                setState(() {
                                  isTab[1] = false;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: isTab[3] ? primaryColor : Colors.white),
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(
                                  color: textColor.withOpacity(0.6),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                enabledBorder: InputBorder.none,
                              ),
                              onTap: (){
                                setState(() {
                                  for (int i =0; i< isTab.length; i++) {
                                    i == 3 ? isTab[3] = true : isTab[i] = false;
                                  }
                                });
                              },
                              onTapOutside: (event){
                                setState(() {
                                  isTab[3] = false;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w,),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: isTab[4] ? primaryColor : Colors.white),
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Subject',
                                hintStyle: TextStyle(
                                  color: textColor.withOpacity(0.6),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                enabledBorder: InputBorder.none,
                              ),
                              onTap: (){
                                setState(() {
                                  for (int i =0; i< isTab.length; i++) {
                                    i == 4 ? isTab[4] = true : isTab[i] = false;
                                  }
                                });
                              },
                              onTapOutside: (event){
                                setState(() {
                                  isTab[4] = false;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: isTab[5] ? primaryColor : Colors.white),
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Description',
                          hintStyle: TextStyle(
                            color: textColor.withOpacity(0.6),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          enabledBorder: InputBorder.none,
                        ),
                        onTap: (){
                          setState(() {
                            for (int i =0; i< isTab.length; i++) {
                              i == 5 ? isTab[5] = true : isTab[i] = false;
                            }
                          });
                        },
                        onTapOutside: (event){
                          setState(() {
                            isTab[5] = false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        height: 40,
                        width: 130,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5
                        ),
                        decoration: BoxDecoration(
                          color: isHover ? secondaryColor : primaryColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Center(
                          child: Text('Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),

                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
