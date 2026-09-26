import 'package:flutter/material.dart';
import 'package:kitway_app/core/theme/app_colors.dart';
import 'package:kitway_app/core/theme/app_text_styles.dart';
import 'package:kitway_app/features/auth/presentation/screens/signup_screen.dart';

import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../../../home/presentation/screens/home_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginscreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  bool obscurePassword = true;
  bool rememberMe = false;
  bool isLoading = false;

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final email = emailController.text.trim();
    final password = passwordController.text;

    setState(() {
      isLoading = true;
    });

    print('Email: $email');
    print('Password: $password');

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
    Navigator.pushReplacementNamed(
        context,
        HomeScreen.routeName,);
    print("Login completed");
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 30,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Logo
                Image.asset(
                  'assets/images/kitway_logo_light.jpeg',
                  width: 200,
                  height: 130,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 20),

                // Title
                Text(
                  'Welcome Back',
                  style: AppTextStyles.title,
                ),

                const SizedBox(height: 6),

                Text(
                  'Sign in to continue',
                  style: AppTextStyles.subtitle,
                ),

                const SizedBox(height: 30),

                // Email
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: CustomTextField(
                    controller: emailController,
                    hintText: 'Email or Phone Number',
                    prefixIcon: Icons.person_outline,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }

                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }

                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 15),

                // Password
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    prefixIcon: Icons.lock_outline,
                    obscureText: obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }

                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }

                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 10),

                // Remember + Forgot Password
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      activeColor: AppColors.primary,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),

                    const Text(
                      'Remember me',
                      style: AppTextStyles.subtitle,
                    ),

                    const Spacer(),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          ForgotPasswordScreen.routeName,
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: AppTextStyles.link,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: CustomButton(
                    text: 'Login',
                    onPressed: login,
                    isLoading: isLoading,
                  ),
                ),

                const SizedBox(height: 25),

                // Divider
                Row(
                  children: [
                    const Expanded(
                      child: Divider(color: AppColors.lightGray),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Text(
                        'Or continue with',
                        style: AppTextStyles.subtitle,
                      ),
                    ),
                    const Expanded(
                      child: Divider(color: AppColors.lightGray),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Social Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialButton(
                      icon: Icons.g_mobiledata,
                    ),
                    const SizedBox(width: 15),
                    _socialButton(
                      icon: Icons.apple,
                    ),
                    const SizedBox(width: 15),
                    _socialButton(
                      icon: Icons.facebook,
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: AppTextStyles.subtitle,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          SignUpScreen.routeName,
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: AppTextStyles.link,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton({required IconData icon}) {
    return Container(
      width: 55,
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.lightGray,
        ),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon),
        color: AppColors.black,
      ),
    );
  }
}
