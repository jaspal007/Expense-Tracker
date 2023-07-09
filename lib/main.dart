import 'package:flutter/material.dart';

import 'widget/expenses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // void setTheme() {
  //   setState(() {
  //     themeMode == ThemeMode.system;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: themeDataLight,
      darkTheme: themeDataDark,
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    );
  }
}

//light theme
final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(250, 227, 146, 1),
);

final ThemeData themeDataLight = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: kColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme.inversePrimary,
    foregroundColor: kColorScheme.inverseSurface,
  ),
  scaffoldBackgroundColor: kColorScheme.background,
  cardTheme: const CardTheme().copyWith(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    color: kColorScheme.background,
    margin: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 6,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: kColorScheme.tertiary,
      elevation: 5,
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
        bodyLarge: TextStyle(
          color: kColorScheme.tertiary,
          //backgroundColor: Colors.green,
        ),
        bodyMedium: TextStyle(
          color: kColorScheme.inverseSurface,
          //backgroundColor: Colors.red,
        ),
        bodySmall: TextStyle(
          color: kColorScheme.tertiary,
          //backgroundColor: Colors.blue,
        ),
      ),
  snackBarTheme: const SnackBarThemeData().copyWith(
    backgroundColor: kColorScheme.onSecondaryContainer,
  ),
  bottomSheetTheme: const BottomSheetThemeData().copyWith(
    backgroundColor: kColorScheme.onTertiary,
    showDragHandle: true,
  ),
);

//dark theme
final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromRGBO(250, 227, 146, 1),
);

final ThemeData themeDataDark = ThemeData.dark().copyWith(
  useMaterial3: true,
  colorScheme: kDarkColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kDarkColorScheme.onInverseSurface,
    foregroundColor: kDarkColorScheme.onPrimaryContainer,
  ),
  scaffoldBackgroundColor: kDarkColorScheme.background,
  cardTheme: const CardTheme().copyWith(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    color: kDarkColorScheme.inverseSurface,
    margin: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 6,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: kDarkColorScheme.tertiary,
      elevation: 5,
    ),
  ),
  textTheme: ThemeData().textTheme.copyWith(
        bodyLarge: TextStyle(
          color: kDarkColorScheme.tertiary,
          //backgroundColor: Colors.green,
        ),
        bodyMedium: TextStyle(
          color: kDarkColorScheme.onInverseSurface,
          //backgroundColor: Colors.red,
        ),
        bodySmall: TextStyle(
          color: kDarkColorScheme.tertiary,
          //backgroundColor: Colors.blue,
        ),
      ),
  snackBarTheme: const SnackBarThemeData().copyWith(
    backgroundColor: kDarkColorScheme.onSecondaryContainer,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData().copyWith(
    backgroundColor: kDarkColorScheme.tertiaryContainer,
    showDragHandle: true,
  ),
);
