import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.transparentColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColor.whiteColor,
      unselectedItemColor: AppColor.blackColor,
      showUnselectedLabels: true,

    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.blackColor,
      centerTitle:  true,
      iconTheme: IconThemeData(
        color: AppColor.primaryColor
      ),
    )
  );
}
