import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/Utils/App_Colors.dart';
import 'package:news_app/Utils/App_Text_Styles.dart';

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            // width: 50,
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(15)),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'Assets/TrainingPlayers.jpg',
                  width: 150,
                  fit: BoxFit.cover,
                  height: 110,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'mancity stay perfect despite Rodi red aganist forest',
                      style: getSmallStyle(fontSize: 10),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: AppColors.whiteColor,
                          size: 14,
                        ),
                        const Gap(5),
                        Text('Read', style: getSmallStyle()),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          );
        });
  }
}
