import 'package:absolute_stay_site/app/sections/Animated_dialogue/login_options.dart';
import 'package:absolute_stay_site/app/sections/user/user_mobile/user_profile.dart';
import 'package:absolute_stay_site/app/sections/user/user_web/user_profile_web.dart';
import 'package:flutter/material.dart';

class UserCustomDialog extends StatelessWidget {
  const UserCustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      backgroundColor: Colors.transparent,
      child: Align(
          alignment: Alignment.topRight,
          child: UserProfileWeb()), // Replace with your dialog content
    );
  }
}
