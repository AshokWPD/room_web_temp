import 'package:flutter/material.dart';

import '../../owner/Owner_mobile/vacantCustomSwitchMob.dart';


class VacantListPage extends StatefulWidget {
  const VacantListPage({super.key});

  @override
  State<VacantListPage> createState() => _VacantListPageState();
}

class _VacantListPageState extends State<VacantListPage> {
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
