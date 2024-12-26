import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/features/auth/phone/screens/phone_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PhoneScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wihte,
      body: Center(child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.logo1),
           const SizedBox(height: 20),
            const CircularProgressIndicator(
              color: AppColors.firebaseAmber,
            ), 
        ],
      ),));
  }
}