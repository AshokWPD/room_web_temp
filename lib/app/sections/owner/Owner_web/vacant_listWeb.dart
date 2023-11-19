
import 'package:absolute_stay_site/usable/core/color/colors.dart';
import 'package:flutter/material.dart';

import 'vacantCustomSwitchWeb.dart';


class VacantListPageWeb extends StatefulWidget {
  const VacantListPageWeb({super.key});

  @override
  State<VacantListPageWeb> createState() => _VacantListPageWebState();
}

class _VacantListPageWebState extends State<VacantListPageWeb> {
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  const SingleChildScrollView(
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
                VacantCustomSwitchMobile(), // This is your custom switch widget.
              ],
            ),
          ),
        ),
      ),
    );
  }
}
