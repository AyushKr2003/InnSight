import 'package:flutter/material.dart';
import 'package:inn_sight/views/auth/login_page.dart';
import 'package:inn_sight/views/auth/signup_page.dart';
// Uncomment and add the remaining pages when they are available:
// import 'package:inn_sight/views/home/home_page.dart';
import 'package:inn_sight/views/map/map_page.dart';
// import 'package:inn_sight/views/profile/profile_page.dart';
// import 'package:inn_sight/views/property/property_details_page.dart';
// import 'package:inn_sight/views/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String map = '/map';
  static const String profile = '/profile';
  static const String propertyDetails = '/property-details';

  /// Use this when setting `routes:` inside MaterialApp
  static Map<String, WidgetBuilder> get routes => {
    login: (context) => const LoginPage(),
    signup: (context) => const SignUpPage(),
    // Add these when pages are available:
    // splash: (context) => const SplashScreen(),
    // home: (context) => const HomePage(),
    map: (context) => const MapPage(),
    // profile: (context) => const ProfilePage(),
    // propertyDetails: (context) => const PropertyDetailsPage(),
  };
}
