import 'package:flutter/material.dart';
import 'ownerCustomSwitchMob.dart'; // Import your custom switch widget.

class MyPropertyAppMobile extends StatefulWidget {
  const MyPropertyAppMobile({super.key});

  @override
  State<MyPropertyAppMobile> createState() => _MyPropertyAppMobileState();
}

class _MyPropertyAppMobileState extends State<MyPropertyAppMobile> {
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'My Property',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(height: 30,),
                OwnerCustomSwitchMobile(), // This is your custom switch widget.
              ],
            ),
          ),
        ),
      ),
    );
  }
}
