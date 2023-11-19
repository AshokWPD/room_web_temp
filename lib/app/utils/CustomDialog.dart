import 'package:absolute_stay_site/app/sections/Animated_dialogue/login_options.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      backgroundColor: Colors.transparent,
      child: Align(
        alignment: Alignment.topRight,
          child: LoginOptions()), // Replace with your dialog content
    );
  }
}
