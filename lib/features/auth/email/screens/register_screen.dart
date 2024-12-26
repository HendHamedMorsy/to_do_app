import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/components/app_button.dart';
import 'package:to_do_app/core/components/app_text_field.dart';
import 'package:to_do_app/core/components/social_media_button.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/features/auth/phone/screens/otp_verification_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.wihte,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Form(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 32.h,
                    ),
                    Image.asset(
                      AppAssets.mobileLogin,
                      width: 225,
                      height: 225,
                    ),
                    const Text(
                      "Create Your Account",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Fill These Information To Complete Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.black.withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: 42.h,
                    ),
                    AppTextField(
                      controller: _nameController,
                      hint: "Enter your name",
                      prefixIcon: Icon(
                        Icons.mail,
                        color: AppColors.black.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField(
                      controller: _emailController,
                      hint: "Enter your email",
                      prefixIcon: Icon(
                        Icons.mail,
                        color: AppColors.black.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppTextField(
                      controller: _passwordController,
                      hint: "Enter your Password ",
                      isObscure: true,
                      prefixIcon: Icon(
                        Icons.password,
                        color: AppColors.black.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    AppButton(
                      label: "Sign up with email",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const OTPVerficationScreen()),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SocialMediaButton(
                      label: "Sign up with Google",
                      icon: Image.asset(AppAssets.google),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
