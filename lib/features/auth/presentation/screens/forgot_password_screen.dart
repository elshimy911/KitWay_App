import 'package:flutter/material.dart';
import 'package:kitway_app/core/theme/app_colors.dart';
import 'package:kitway_app/core/theme/app_text_styles.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = 'forgotPassword';

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  bool isLoading = false;

  Future<void> sendResetLink() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(
      const Duration(seconds: 2),
    );

    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Password reset link sent to your email',
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
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

                Image.asset(
                  'assets/images/kitway_logo_light.jpeg',
                  width: 180,
                  height: 100,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 25),

                Text(
                  'Forgot Password?',
                  style: AppTextStyles.title,
                ),

                const SizedBox(height: 8),

                Text(
                  'Enter your email and we will send you a password reset link.',
                  style: AppTextStyles.subtitle,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                CustomTextField(
                  controller: emailController,
                  hintText: 'Email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                CustomButton(
                  text: 'Send Reset Link',
                  onPressed: sendResetLink,
                  isLoading: isLoading,
                ),

                const SizedBox(height: 20),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back to Login',
                    style: AppTextStyles.link,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
