import 'package:flutter/material.dart';
import 'package:news_app/Utils/App_Colors.dart';
import 'package:news_app/Utils/App_Text_Styles.dart';

class SourceView extends StatelessWidget {
  const SourceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Text(
          'Source',
          style: getHeadlineStyle(),
        ),
      ),
    );
  }
}
