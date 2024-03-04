import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Home/splash_view.dart';
import 'package:news_app/Core/Data/ViewModel/home_cubit.dart';
import 'package:news_app/Utils/App_Colors.dart';
import 'package:news_app/Utils/App_Text_Styles.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.blackColor,
            appBarTheme: AppBarTheme(
              color: AppColors.darkThemeColor,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: AppColors.lemonadeColor,
              unselectedItemColor: AppColors.greyColor,
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.darkThemeColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: getSmallStyle(),
              fillColor: Colors.grey[800],
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
            )),
        home: const SplashView(),
      ),
    );
  }
}
