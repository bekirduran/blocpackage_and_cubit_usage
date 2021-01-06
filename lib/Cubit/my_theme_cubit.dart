import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyThemeCubit extends Cubit<ThemeData>{
  MyThemeCubit() : super(_darkMode);

  static final ThemeData _lightMode  = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
    ),
    brightness: Brightness.light
  );

  static final ThemeData _darkMode  = ThemeData(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.amber,
      ),
      brightness: Brightness.dark
  );

  void ThemeChange()
  {
   emit(state.brightness == Brightness.dark ? _lightMode: _darkMode);
  }

}