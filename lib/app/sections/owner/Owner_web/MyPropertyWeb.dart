import 'package:flutter/material.dart';
import 'ownerCustomSwitchweb.dart'; // Import your custom switch widget.

class MyPropertyAppWeb extends StatefulWidget {
  const MyPropertyAppWeb({super.key});

  @override
  State<MyPropertyAppWeb> createState() => _MyPropertyAppWebState();
}

class _MyPropertyAppWebState extends State<MyPropertyAppWeb> {
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Property',style: TextStyle(color: customColor,fontSize: 25),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(height: 30,),
                OwnerCustomSwitchMobile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
