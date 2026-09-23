import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/theme/app_colors.dart';
import 'package:islami_app/features/layout/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami_app/features/layout/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/features/layout/tabs/radio_tab/radio_tab.dart';
import 'package:islami_app/features/layout/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_app/features/layout/tabs/time_tab/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.white,
        backgroundColor: AppColors.secondaryColor,
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/quran.svg"),
            label: "Quran",
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                "assets/icons/quran.svg",
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/hadeth.svg"),
            label: "Hadeth",
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                "assets/icons/hadeth.svg",
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/sebha.svg"),
            label: "Sebha",
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                "assets/icons/sebha.svg",
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/radio.svg"),
            label: "Radio",
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                "assets/icons/radio.svg",
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Vector.svg"),
            label: "Time",
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                "assets/icons/Vector.svg",
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
      body: tabs[currentIndex],
    );
  }
}
