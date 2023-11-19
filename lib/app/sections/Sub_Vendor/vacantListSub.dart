
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:flutter/material.dart';

import 'vacanttogle.dart';



class VacantListPageSub extends StatefulWidget {
  const VacantListPageSub({super.key});

  @override
  State<VacantListPageSub> createState() => _VacantListPageSubState();
}

class _VacantListPageSubState extends State<VacantListPageSub> {
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text('Vacant List',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    fontFamily: 'josefinsans',
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 30,),
                VacantCustomSwitchSub(), // This is your custom switch widget.
              ],
            ),
          ),
        ),
      ),
    );
  }
}
