import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

final appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  useMaterial3: true,

  /// Text Button theme
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.only(right: 6)),
      minimumSize: WidgetStateProperty.all<Size>(Size.zero),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  ),

  /// Elevated Button theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.resolveWith<TextStyle?>(
        (Set<WidgetState> states) {
          return const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
        },
      ),
      elevation: WidgetStateProperty.all(0.2),
      foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      backgroundColor: WidgetStateProperty.all<Color>(AppColors.primaryColor),
    ),
  ),

  /// Cursor color
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.textFieldBorderColor,
    selectionColor: AppColors.primaryColor,
    selectionHandleColor: AppColors.primaryColor,
  ),

  /// TextBox theme
  inputDecorationTheme: InputDecorationTheme(
    // hintStyle: AppTextStyle().montserrat16W500Grey,
    labelStyle: TextStyle(color: AppColors.textFieldBorderColor),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.textFieldBorderColor),
      borderRadius: BorderRadius.circular(4),
    ),
    activeIndicatorBorder: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
      borderRadius: BorderRadius.circular(4),
    ),
    outlineBorder: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
      borderRadius: BorderRadius.circular(4),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
  ),

  /// Radio button
  radioTheme: RadioThemeData(
    visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    fillColor: WidgetStateProperty.all<Color>(AppColors.primaryColor),
  ),

  /// Divider
  dividerTheme: const DividerThemeData(
    thickness: 1.5,
    color: CupertinoColors.systemGrey5,
  ),

  /// Floating action button
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    backgroundColor: AppColors.primaryColor,
    foregroundColor: AppColors.white,
    elevation: 2,
    // iconSize: 36,
  ),

  /// Progress indicator theme
  progressIndicatorTheme: ProgressIndicatorThemeData(
    circularTrackColor: AppColors.primaryColor,
    color: AppColors.primaryColor,
    refreshBackgroundColor: AppColors.primaryColor,
  ),

  /// Slider theme
  sliderTheme:
      SliderThemeData(thumbColor: AppColors.primaryColor, activeTrackColor: AppColors.primaryColor, inactiveTrackColor: AppColors.lightBorderColor),

  /// Dropdown theme
  dropdownMenuTheme: DropdownMenuThemeData(
    menuStyle: MenuStyle(
      padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 8)),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(side: BorderSide(color: AppColors.textFieldBorderColor), borderRadius: BorderRadius.circular(8))),
      side: WidgetStateProperty.all(BorderSide(color: AppColors.textFieldBorderColor)),
    ),
  ),

  ///AppBar theme
  appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.white),
      color: AppColors.primaryColor,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
      ),
      actionsIconTheme: IconThemeData(color: AppColors.white)),

  /// In material3 , If we don't apple this , Appbar is getting transparent when scroll-up
);
