import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/Home/Features/home_view.dart';
import 'package:news_app/Utils/App_Colors.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  final int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeView(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              value = _index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('Assets/HomeIcon.svg',
                  colorFilter:
                      ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn)),
              activeIcon: SvgPicture.asset(
                'Assets/HomeIcon.svg',
                colorFilter:
                    ColorFilter.mode(AppColors.lemonadeColor, BlendMode.srcIn),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'Assets/SearchIcon.svg',
                colorFilter:
                    ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                'Assets/SearchIcon.svg',
                colorFilter:
                    ColorFilter.mode(AppColors.lemonadeColor, BlendMode.darken),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'Assets/FolderIcon.svg',
                colorFilter:
                    ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                'Assets/FolderIcon.svg',
                colorFilter:
                    ColorFilter.mode(AppColors.lemonadeColor, BlendMode.darken),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'Assets/ProfileIcon.svg',
                colorFilter:
                    ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                'Assets/ProfileIcon.svg',
                colorFilter:
                    ColorFilter.mode(AppColors.lemonadeColor, BlendMode.darken),
              ),
              label: '',
            )
          ]),
    );
  }
}
