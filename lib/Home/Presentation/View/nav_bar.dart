import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/Functions/profile_view.dart';
import 'package:news_app/Functions/Search/searc_view.dart';
import 'package:news_app/Functions/source_view.dart';
import 'package:news_app/Home/Presentation/View/home_view.dart';
import 'package:news_app/Utils/App_Colors.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int _index = 0;
  List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    const SourceView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[
          _index], // here where NavBarWidget can display any page as per its index
      bottomNavigationBar: BottomNavigationBar(
          // type: BottomNavigationBarType.fixed,
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('Assets/HomeIcon.svg'),
                activeIcon: SvgPicture.asset(
                  'Assets/HomeIcon.svg',
                  colorFilter: ColorFilter.mode(
                      AppColors.lemonadeColor, BlendMode.srcIn),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('Assets/SearchIcon.svg'),
                activeIcon: SvgPicture.asset(
                  'Assets/SearchIcon.svg',
                  colorFilter: ColorFilter.mode(
                      AppColors.lemonadeColor, BlendMode.srcIn),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('Assets/FolderIcon.svg'),
                activeIcon: SvgPicture.asset(
                  'Assets/FolderIcon.svg',
                  colorFilter: ColorFilter.mode(
                      AppColors.lemonadeColor, BlendMode.srcIn),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('Assets/ProfileIcon.svg'),
                activeIcon: SvgPicture.asset(
                  'Assets/ProfileIcon.svg',
                  colorFilter: ColorFilter.mode(
                      AppColors.lemonadeColor, BlendMode.srcIn),
                ),
                label: ''),
          ]),
    );
  }
}
