import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.label, this.onPressed, this.width, this.buttonColor});
  final String? label;
  final VoidCallback? onPressed;
  final double? width;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width??double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:buttonColor?? AppColors.firebaseAmber,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding:const  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          label ?? "",
          style:const  TextStyle(color: AppColors.wihte,fontWeight: FontWeight.w700,fontSize: 16),
        ),
      ),
    );
  }
}
