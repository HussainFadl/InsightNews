import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/Home/Data/article.dart';
import 'package:news_app/Utils/App_Buttons.dart';
import 'package:news_app/Utils/App_Colors.dart';
import 'package:news_app/Utils/App_Text_Styles.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key, required this.model});
  final Article model;
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(model.url ?? ''))) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // _launchUrl();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.whiteColor,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomButton(
            foreground: AppColors.darkThemeColor,
            background: AppColors.lemonadeColor,
            text: 'Go To WebSite for Details',
            onPressed: () {
              _launchUrl();
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                model.urlToImage ?? '',
                errorBuilder: (context, error, stackTrace) {
                  return Container(child: const Icon(Icons.error));
                },
              ),
            ),
            const Gap(15),
            Row(
              children: [
                Expanded(
                  child: Text(
                    model.title ?? '',
                    style: getTitleStyle(color: AppColors.whiteColor),
                  ),
                ),
              ],
            ),
            const Gap(15),
            Text(
              model.author ?? '',
              style: getTitleStyle(color: AppColors.whiteColor),
            ),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  model.publishedAt?.split('T')[0] ?? '',
                  style: getSmallStyle(color: AppColors.greyColor),
                ),
              ],
            ),
            Expanded(
              child: Text(
                model.description ?? '',
                style: getBodyStyle(color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
