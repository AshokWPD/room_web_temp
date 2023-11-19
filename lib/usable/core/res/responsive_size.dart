import 'package:flutter/material.dart';

double isFontSize(BuildContext context, double val) {
  double width = MediaQuery.of(context).size.width;
  if (width >= 1050) {
    return val;
  } else if (width < 1050 && width >= 600) {
    return val;
  } else {
    return val;
  }
}
