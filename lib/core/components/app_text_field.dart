import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.keyboardType,
    this.inputAction,
    this.label,
    this.hint,
    this.isObscure = false,
    this.maxLines = 1,
    this.isLabelEnabled = false,
    this.validator,
    required this.controller,
    this.prefixIcon,
    this.padding = const EdgeInsets.all(0),
  });

  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final String? label;
  final String? hint;
  final bool isObscure;
  final int maxLines;
  final bool isLabelEnabled;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isObscure,
        textInputAction: inputAction,
        cursorColor: AppColors.firebaseYellow,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          labelText: isLabelEnabled ? label : null,
          labelStyle: const TextStyle(color: AppColors.firebaseYellow),
          hintText: hint,
          hintStyle: TextStyle(
            color: AppColors.black.withOpacity(0.5),
            fontSize: 14,
          ),
          errorStyle: const TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: AppColors.firebaseAmber,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: AppColors.firebaseGrey,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.redAccent,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.redAccent,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
