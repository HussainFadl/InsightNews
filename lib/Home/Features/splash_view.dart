import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Core/local_storage.dart';
import 'package:news_app/Home/Features/upload_view.dart';
import 'package:news_app/Home/Presentation/View/nav_bar.dart';
import 'package:news_app/Utils/App_Colors.dart';
import 'package:news_app/Utils/App_Functions.dart';
import 'package:news_app/Utils/App_Text_Styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    late bool isUpLoad;

    AppLocal.getCachedData(AppLocal.ISUPLOAD_KEY).then((value) {
      isUpLoad = value ?? false;
    });
    Future.delayed(const Duration(seconds: 5), () {
      AppFunctions.getMoveToNextPageReplacement(
          context: context,
          theScreenYouWantToProceed:
              isUpLoad ? const NavBarWidget() : const UpLoadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('Assets/Animation - globeNews.json',
                  width: 400, height: 400),
              Text(
                '''Insight News''',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: AppColors.lemonadeColor),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Stay Informed anytime, anywhere ....',
                  style: getSmallStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
