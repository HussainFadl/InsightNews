import 'dart:io';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/Core/local_storage.dart';
import 'package:news_app/Functions/profile_view.dart';
import 'package:news_app/Home/Presentation/Widgets/news_list_widget.dart';
import 'package:news_app/Utils/App_Colors.dart';
import 'package:news_app/Utils/App_Functions.dart';
import 'package:news_app/Utils/App_Text_Styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? name;
  String? path;
  int itemIndex = 0;

  @override
  void initState() {
    super.initState();
    AppLocal.getCachedData(AppLocal.IMAGE_KEY).then((value) {
      setState(() {
        path = value;
      });
    });
    AppLocal.getCachedData(AppLocal.NAME_KEY).then((value) {
      setState(() {
        name = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(10),
                    // header
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello, $name',
                                style: getBodyStyle(
                                    color: AppColors.lemonadeColor),
                              ),
                              Text(
                                'Have a Nice day',
                                style:
                                    getSmallStyle(color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                          GestureDetector(
                              onTap: () {
                                AppFunctions.getMoveToNextPageReplacement(
                                    context: context,
                                    theScreenYouWantToProceed:
                                        const ProfileView());
                              },
                              child: CircleAvatar(
                                radius: 26,
                                backgroundColor: AppColors.primaryColor,
                                backgroundImage: path != null
                                    ? FileImage(File(path!)) as ImageProvider
                                    : const AssetImage(
                                        'Assets/accountingImage.png'),
                              ))
                        ]),
                    const SizedBox(
                      height: 30,
                    ),
                    CarouselSlider.builder(
                      itemCount: 6,
                      itemBuilder:
                          (BuildContext context, int itemIndex, int pageView) =>
                              ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'Assets/player.jpg',
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      options: CarouselOptions(
                          height: 180,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: false,
                          autoPlayInterval: const Duration(seconds: 1),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 8),
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          onPageChanged: (index, reason) {
                            setState(() {
                              itemIndex = index;
                            });
                          },
                          scrollDirection: Axis.horizontal),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                          axisDirection: Axis.horizontal,
                          controller: PageController(
                            initialPage: itemIndex,
                          ),
                          count: 6,
                          effect: ExpandingDotsEffect(
                              activeDotColor: AppColors.lemonadeColor,
                              dotHeight: 8,
                              dotWidth: 8), // your preferred effect
                          onDotClicked: (index) {}),
                    ),
                    const Gap(15),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ButtonsTabBar(
                          // Customize the appearance and behavior of the tab bar
                          backgroundColor: AppColors.lemonadeColor,
                          borderWidth: 2,
                          borderColor: Colors.black,
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedBackgroundColor: Colors.grey[850],
                          unselectedLabelStyle:
                              getSmallStyle(color: AppColors.whiteColor),

                          // Add your tabs here
                          tabs: const [
                            Tab(text: 'Sports'),
                            Tab(text: 'Science'),
                            Tab(text: 'Entertainment'),
                            Tab(text: 'Business'),
                          ]),
                    ),
                    const Gap(15),
                    const Expanded(
                      child: TabBarView(children: [
                        NewsListViewBuilder(category: 'Sports'),
                        NewsListViewBuilder(category: 'Science'),
                        NewsListViewBuilder(category: 'Entertainment'),
                        NewsListViewBuilder(category: 'Business'),
                      ]),
                    )
                  ]),
            ),
          ),
        );
      }),
    );
  }
}
