import 'package:flutter/material.dart';
import 'package:shop_ease/core/theme/app_colors.dart';
import 'package:shop_ease/core/theme/app_text_styles.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_text_field.dart';


class SignUpScreen extends StatefulWidget {
  static const String routeName = 'SinupScreen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool agreeToTerms = false;
  bool isLoading = false;

  Future<void> createAccount() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please agree to the Terms & Conditions",
          ),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    print('Account Created');
  }
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
            vertical: 25,
          ),
          child: Form(
            key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  Image.asset(
                      'assets/images/kitway_logo_light.jpeg',
                    width: 200,
                    height: 130,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 15,),
                  Text(
                      'Create Account',
                    style: AppTextStyles.title,
                  ),
                  const SizedBox(height: 6,),
                  Text(
                    'Create your account to get started',
                    style: AppTextStyles.subtitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25,),

                  CustomTextField(
                      controller: nameController,
                      hintText: 'FullName',
                      prefixIcon: Icons.person_outline,
                      validator: (value){
                        if (value == null || value.trim().isEmpty){
                          return 'please enter your name';
                        }
                        return null;
                      },
                  ),
                  const SizedBox(height: 15,),
                  CustomTextField(
                      controller: phoneController,
                      hintText: 'Phone number',
                      prefixIcon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                      validator: (value){
                        if (value == null || value.trim().isEmpty){
                          return 'Please enter your phone number';
                        }
                        if (value.length < 10){
                          return 'please enter a valid phone number';
                        }
                        return null;
                      },
                  ),
                  const SizedBox(height: 15,),
                  CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if (value == null || value.trim().isEmpty){
                          return 'Please enter your email';
                        }
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                  ),
                  const SizedBox(height: 15,),
                  CustomTextField(
                      controller:passwordController ,
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outline,
                      obscureText: obscurePassword,
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          icon: Icon(
                            obscurePassword
                            ?Icons.visibility_outlined
                                :Icons.visibility_off_outlined,
                          ),
                      ),
                    validator: (value){
                        if (value == null || value.trim().isEmpty){
                          return "Please enter your password";
                        }
                        if (value.length < 6 ){
                          return "paswword must be at least 6 characters";
                        }
                        return null ;
                    },
                  ),
                  const SizedBox(height: 15,),
                  CustomTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      prefixIcon: Icons.lock_outline,
                      obscureText: obscureConfirmPassword,
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          obscureConfirmPassword =
                          !obscureConfirmPassword;
                        });
                      },
                          icon: Icon(
                            obscureConfirmPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                      ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }

                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: agreeToTerms,
                        activeColor: AppColors.primary,
                        onChanged: (value) {
                          setState(() {
                            agreeToTerms = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          'I agree to the Terms & Conditions',
                          style: AppTextStyles.subtitle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: 'Create Account',
                    onPressed: createAccount,
                    isLoading: isLoading,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: AppTextStyles.subtitle,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login',
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
}
