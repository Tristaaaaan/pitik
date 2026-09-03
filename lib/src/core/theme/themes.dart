import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);

  static final ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
      surface: Colors.white,
      primary: Colors.black,
      secondary: Colors.black,
      tertiary: Color.fromARGB(255, 180, 180, 180).withValues(alpha: 0.2),
    ),
  );

  static final ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
      surface: Colors.black,
      primary: Colors.white,
      secondary: Colors.white,
      primaryContainer: Color(0xff151515),
      tertiary: const Color.fromARGB(255, 180, 180, 180).withValues(alpha: 0.2),
    ),
  );

  ThemeData get currentTheme => state ? darkMode : lightMode;

  void toggleTheme() => emit(!state);

  void setTheme(bool isDark) => emit(isDark);
}
