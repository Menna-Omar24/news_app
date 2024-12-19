import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/style/app_colors.dart';

class AppStyle {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: AppColors.greyColor,
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: AppColors.greyDark,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: AppColors.lightPrimary,
      labelStyle: TextStyle(
        fontFamily: 'Exo',
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightPrimary,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 27.sp,
      ),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50.r),
          bottomLeft: Radius.circular(50.r),
        ),
      ),
      titleTextStyle: TextStyle(
        fontFamily: "Exo",
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 22.sp,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightPrimary,
      primary: AppColors.lightPrimary,
    ),
  );
}
