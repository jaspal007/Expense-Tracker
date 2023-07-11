import 'package:expense_tracker/resources/global_variables.dart';
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
  void setSeedColor(BackgroundColors value) {
    setState(() {
      backgroundColors.value = value;
      seedColor.value = backGround[backgroundColors.value]!;
      print(seedColor.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<BackgroundColors>(
      valueListenable: backgroundColors,
      builder: (context, BackgroundColors colors, child) {
        return MaterialApp(
          themeMode: ThemeMode.system,
          theme: themeDataLight,
          darkTheme: themeDataDark,
          debugShowCheckedModeBanner: false,
          home: Expenses(
            backgroundColors: backgroundColors,
            onColorchange: setSeedColor,
          ),
        );
      },
    );
  }
}

Map<BackgroundColors, Color> backGround = {
  BackgroundColors.yellow: const Color(0xFFFFE392),
  BackgroundColors.purple: const Color(0xFFE2C0E9),
  BackgroundColors.green: const Color(0xFFACE3AE),
  BackgroundColors.blue: const Color(0xFF9EC5E5),
  BackgroundColors.pink: const Color(0xFFE0AABC),
};

final ValueNotifier<BackgroundColors> backgroundColors =
    ValueNotifier(BackgroundColors.yellow);
ValueNotifier<Color> seedColor =
    ValueNotifier(backGround[backgroundColors.value]!);

//light theme
final kColorScheme = ColorScheme.fromSeed(
  seedColor: seedColor.value,
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
  inputDecorationTheme: const InputDecorationTheme().copyWith(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: kColorScheme.inversePrimary),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: kColorScheme.inversePrimary, width: 2),
    ),
    prefixStyle: TextStyle(color: kColorScheme.tertiary),
    labelStyle: TextStyle(color: kColorScheme.tertiary),
    hintStyle: TextStyle(color: kColorScheme.tertiary),
  ),
  snackBarTheme: const SnackBarThemeData().copyWith(
    backgroundColor: kColorScheme.onSecondaryContainer,
  ),
  bottomSheetTheme: const BottomSheetThemeData().copyWith(
    constraints: const BoxConstraints.expand(),
    backgroundColor: kColorScheme.secondaryContainer,
    showDragHandle: true,
    dragHandleColor: kColorScheme.onBackground,
  ),
);

//dark theme
final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: seedColor.value,
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
          color: kDarkColorScheme.tertiaryContainer,
          //backgroundColor: Colors.green,
        ),
        bodyMedium: TextStyle(
          color: kDarkColorScheme.onInverseSurface,
          //backgroundColor: Colors.red,
        ),
        bodySmall: TextStyle(
          color: kDarkColorScheme.onInverseSurface,
          //backgroundColor: Colors.blue,
        ),
      ),
  dialogTheme:
      const DialogTheme().copyWith(backgroundColor: kDarkColorScheme.tertiary),
  snackBarTheme: const SnackBarThemeData().copyWith(
    backgroundColor: kDarkColorScheme.onSecondaryContainer,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme().copyWith(
    suffixIconColor: kDarkColorScheme.onInverseSurface,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: kDarkColorScheme.inversePrimary),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: kDarkColorScheme.inversePrimary, width: 2),
    ),
    prefixStyle: TextStyle(color: kDarkColorScheme.tertiaryContainer),
    labelStyle: TextStyle(color: kDarkColorScheme.tertiaryContainer),
    hintStyle: TextStyle(color: kDarkColorScheme.tertiaryContainer),
  ),
  iconTheme:
      const IconThemeData().copyWith(color: kDarkColorScheme.onInverseSurface),
  bottomSheetTheme: const BottomSheetThemeData().copyWith(
    constraints: const BoxConstraints.expand(),
    backgroundColor: kDarkColorScheme.secondary,
    showDragHandle: false,
    dragHandleColor: kDarkColorScheme.background,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
      elevation: 20,
      backgroundColor: kDarkColorScheme.onPrimaryContainer,
      foregroundColor: kDarkColorScheme.onInverseSurface),
);
