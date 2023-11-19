import 'package:absolute_stay_site/usable/core/res/responsive.dart';
import 'package:flutter/material.dart';
import 'Owner_mobile/addProperty_mob.dart';
import 'Owner_web/addProperty_web.dart';
import 'Owner_web/owner_home_web.dart';


class Owner extends StatelessWidget {
  const Owner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: AddPropertyMobile(),
        tablet:OwnerHomeWeb(pagename:AddPropertyWeb(), usedrawer: true,),
        web: OwnerHomeWeb(pagename:AddPropertyWeb(), usedrawer: true,));
  }
}
