import 'package:flutter/material.dart';
import 'package:news_app/Utils/App_Colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.background = const Color(0xff30312D),
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function() onPressed;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: background,
            foregroundColor: AppColors.whiteColor),
        onPressed: onPressed,
        child: Text(
          text,
        ));
  }
}
