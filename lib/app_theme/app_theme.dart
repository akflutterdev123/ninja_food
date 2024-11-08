import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTheme {
  // light color scheme
  static ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.orangeAccent,
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFf79d5c),
    onSecondary: Color(0xFF000000), // Black
    tertiaryContainer: Color(0xFF018786), // Dark Teal
    surface: Color(0xFFFFFFFF), // White
    onSurface: Color(0xFF000000), // Black
    onSurfaceVariant: Color(0xFF757575), // Grey
    background: Color(0xFFF5F5F5), // Light Grey
    onBackground: Color(0xFF000000), // Black
    error: Color(0xFFB00020), // Red
    outline: Color(0xFFBDBDBD), // Light Grey
    onError: Color(0xFFFFFFFF), // White
  );

  static ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFBB86FC), // Light Purple
    onPrimary: Color(0xFF000000), // Black
    secondary: Color(0xFF03DAC6), // Teal
    onSecondary: Color(0xFF000000), // Black
    tertiaryContainer: Color(0xFF03DAC6), // Teal
    surface: Color(0xFF1E1E1E), // Dark Grey
    onSurface: Color(0xFFE0E0E0), // Light Grey
    onSurfaceVariant: Color(0xFF757575), // Grey
    background: Color(0xFF121212), // Dark Grey
    onBackground: Color(0xFFE0E0E0), // Light Grey
    error: Color(0xFFCF6679), // Red
    outline: Color(0xFFBDBDBD), // Light Grey
    onError: Color(0xFF000000), // Black
  );

  // dark color scheme

  // text theme
  static TextTheme textTheme = TextTheme(
    titleSmall: TextStyle(
        fontSize: 16.sp, fontWeight: FontWeight.w700, fontFamily: 'Lato'),
    titleMedium: TextStyle(
        fontSize: 18.sp, fontWeight: FontWeight.w700, fontFamily: 'Lato'),
    titleLarge: TextStyle(
        fontSize: 22.sp, fontWeight: FontWeight.w700, fontFamily: 'Lato'),
    headlineSmall: TextStyle(
        fontSize: 14.sp, fontWeight: FontWeight.w500, fontFamily: 'Lato'),
    headlineMedium: TextStyle(
        fontSize: 18.sp, fontWeight: FontWeight.w500, fontFamily: 'Lato'),
    headlineLarge: TextStyle(
        fontSize: 20.sp, fontWeight: FontWeight.w500, fontFamily: 'Lato'),
    bodySmall: TextStyle(
        fontSize: 14.sp, fontFamily: 'Lato', fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(
        fontSize: 16.sp, fontFamily: 'Lato', fontWeight: FontWeight.w400),
    bodyLarge: TextStyle(
        fontSize: 18.sp, fontFamily: 'Lato', fontWeight: FontWeight.w400),
    labelSmall: TextStyle(
        fontSize: 14.sp, fontFamily: 'Lato', fontWeight: FontWeight.w400),
    labelMedium: TextStyle(
        fontSize: 16.sp, fontFamily: 'Lato', fontWeight: FontWeight.w400),
    labelLarge: TextStyle(
        fontSize: 16.sp, fontFamily: 'Lato', fontWeight: FontWeight.w400),
    displaySmall: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
    ),
    displayLarge: TextStyle(
      fontSize: 18.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
    ),
  );

  static ThemeData _themeData({bool isDark = false}) {
    final ThemeData base = isDark ? ThemeData.dark() : ThemeData.light();
    final ColorScheme colorScheme = isDark ? darkColorScheme : lightColorScheme;

    return base.copyWith(
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          titleTextStyle: TextStyle(
              fontSize: 18.sp,
              color: colorScheme.primary,
              fontWeight: FontWeight.w500),
          surfaceTintColor: Colors.transparent,
        ),
        dividerTheme: DividerThemeData(
            color: colorScheme.onSecondary.withOpacity(0.5), thickness: 2.sp),
        iconTheme: IconThemeData(
            size: 20.px, color: colorScheme.primary.withOpacity(0.5)),
        dropdownMenuTheme: const DropdownMenuThemeData(
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(borderSide: BorderSide(width: 1)))),
        // switchTheme: SwitchThemeData(
        //     overlayColor:
        //         MaterialStateProperty.all<Color>(colorScheme.primary)),
        // inputDecorationTheme: InputDecorationTheme(
        //     filled: false,
        //     border:
        //         OutlineInputBorder(borderRadius: BorderRadius.circular(10.sp))),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 3,
          surfaceTintColor: Colors.transparent,
          margin: EdgeInsets.all(0.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.sp)),
          ),
        ),
        textTheme: base.textTheme.merge(textTheme),
        // dialogTheme: DialogTheme(backgroundColor: Colors.blue),
        switchTheme: SwitchThemeData(
          overlayColor: MaterialStateProperty.all<Color>(colorScheme.secondary),
        ).copyWith(
          thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
            (Set<MaterialState> states) {
              // Thumb icon when the switch is selected.
              if (states.contains(MaterialState.selected)) {
                return const Icon(Icons.check);
              }
              return const Icon(Icons.close);
            },
          ),
          thumbColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colorScheme.secondary;
            }
            return null;
          }),
          trackColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colorScheme.secondary;
            }
            return null;
          }),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colorScheme.secondary;
            }
            return null;
          }),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colorScheme.secondary;
            }
            return null;
          }),
        ),
        dialogTheme: DialogTheme(
            elevation: 0,
            backgroundColor: colorScheme.surface,
            surfaceTintColor: Colors.transparent),
        dialogBackgroundColor: Colors.white,
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white, surfaceTintColor: Colors.white));
  }

  ThemeData getAppThemeData(BuildContext context, bool isDarkModeEnabled) {
    return isDarkModeEnabled ? _themeData(isDark: true) : _themeData();
  }
}
