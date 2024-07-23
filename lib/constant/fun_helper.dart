import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

String getWeatherIconUrl(String iconCode) {
  return 'http://openweathermap.org/img/wn/$iconCode.png';
}

navTo(context, widget) {
  return   Navigator.push(context,
    PageTransition(
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 700),
        child:  widget),);




}
