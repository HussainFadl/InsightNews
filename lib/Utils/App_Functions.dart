import 'package:flutter/material.dart';
import 'package:news_app/Utils/App_Colors.dart';
import 'package:news_app/Utils/App_Text_Styles.dart';

class AppFunctions {
  static getMoveToNextPageReplacement({
    required context,
    required theScreenYouWantToProceed,
  }) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => theScreenYouWantToProceed));
  }

  static showMySnackBar(context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.redColor,
      content: Text((text), style: getSmallStyle(color: AppColors.blackColor)),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
    ));
  }

  static getMoveToNextPagePush({
    required context,
    required theScreenYouWantToProceed,
  }) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => theScreenYouWantToProceed));
  }
}
