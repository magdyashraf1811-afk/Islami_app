import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/images.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.quranBg,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: AppColor.primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },

              backgroundColor: AppColor.primaryColor,
              type: BottomNavigationBarType.fixed,
              items: [
                builtBottomNavBar(
                  iconName: AppAssets.iconQuranBg,
                  label: 'Quran',
                  index: 0,
                ),
                builtBottomNavBar(
                  iconName: AppAssets.hadethIcon,
                  label: 'Hadeth',
                  index: 1,
                ),
                builtBottomNavBar(
                  iconName: AppAssets.sebhaIcon,
                  label: 'Sebha',
                  index: 2,
                ),
                builtBottomNavBar(
                  iconName: AppAssets.radioIcon,
                  label: 'Radio',
                  index: 3,
                ),
                builtBottomNavBar(
                  iconName: AppAssets.timeIcon,
                  label: 'Time',
                  index: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem builtBottomNavBar({
    required String iconName,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon:selectedIndex==index?
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: AppColor.blackbgColor
        ),
        child: ImageIcon(AssetImage(iconName)),
      ):ImageIcon(AssetImage(iconName)) ,  label: label
    );
  }
}
