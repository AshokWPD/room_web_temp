
import 'package:flutter/material.dart';

import 'vacantCustomSwitchMob.dart';


class VacantListPageMobile extends StatefulWidget {
  const VacantListPageMobile({super.key});

  @override
  State<VacantListPageMobile> createState() => _VacantListPageMobileState();
}

class _VacantListPageMobileState extends State<VacantListPageMobile> {
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Vacant List',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body:  const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
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
