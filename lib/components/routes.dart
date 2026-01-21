import 'package:flutter/material.dart';
import 'package:ibank/loginScreen.dart';
import 'package:ibank/homeScreen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => const LoginScreen(),
  '/home': (context) => const Homescreen(),
};
