import 'package:flutter/material.dart';
import 'package:kitway_app/features/splash/presentation/screens/splash_screen.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.routeName,
      routes: AppRoutes.routes,
      theme: AppTheme.lightTheme,
      );
  }
}
