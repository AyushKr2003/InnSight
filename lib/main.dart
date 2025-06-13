import 'package:flutter/material.dart';
import 'package:inn_sight/core/routes/routes.dart';
import 'package:inn_sight/core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inn Sight',
      theme: innSightDarkTheme,
      initialRoute: AppRoutes.signup,
      routes: AppRoutes.routes,
      // home: SignUpPage(),
    );
  }
}
