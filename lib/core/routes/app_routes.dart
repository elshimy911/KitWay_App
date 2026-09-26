import 'package:flutter/cupertino.dart';
import 'package:shop_ease/features/auth/presentation/screens/login_screen.dart';
import 'package:shop_ease/features/auth/presentation/screens/signup_screen.dart';
import 'package:shop_ease/features/splash/presentation/screens/splash_screen.dart';
import 'package:shop_ease/features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/home/presentation/screens/orders_screen.dart';

class AppRoutes{
  static Map<String,WidgetBuilder>routes={
    SplashScreen.routeName:(_)=>const SplashScreen(),
    LoginScreen.routeName:(_)=> const LoginScreen(),
    SignUpScreen.routeName: (_) => const SignUpScreen(),
    ForgotPasswordScreen.routeName: (_) => const ForgotPasswordScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    OrdersScreen.routeName: (context) => const OrdersScreen(),
  };
}