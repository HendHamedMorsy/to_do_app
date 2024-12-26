import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key, this.label, this.icon, this.onPressed});
  final String? label;
  final Widget? icon;
final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        icon: icon,
        onPressed: onPressed,
        label:  Text(
         label??"",
          style: const TextStyle(
            color: AppColors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.firebaseGrey,
        
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      ),
    );
  }
}
