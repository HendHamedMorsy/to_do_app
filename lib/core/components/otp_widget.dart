import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class OTPWidget extends StatelessWidget {
  final String? errorMessage;
  final TextEditingController? pinController;
  OTPWidget({
    super.key,
    this.pinController,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      errorText: errorMessage,
      errorBuilder: (errorText, pin) {
        return Padding(
          padding: EdgeInsets.only(top: 14.h),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 9.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.redAccent.withOpacity(0.08),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 5.w),
                  child: const Icon(
                    Icons.info,
                    color: Colors.redAccent,
                  ),
                ),
                Text(errorMessage ?? ""),
              ],
            ),
          ),
        );
      },
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
        border: Border.all(color:  AppColors.firebaseAmber),
        borderRadius: BorderRadius.circular(14.r),
      )
      ),
      errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
 
        border: Border.all( color: Colors.redAccent,),
        borderRadius: BorderRadius.circular(14.r),
      )),
      length: 6,
      showCursor: true,
      cursor: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 25,
            height: 1,
            color: AppColors.black.withOpacity(0.2),
          ),
        ),
      ),
    );
  }

  final PinTheme defaultPinTheme = PinTheme(
    width: 70,
    height: 55,
    textStyle: TextStyle(
        fontSize: 30.spMin,
        color: AppColors.black,
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
        border: Border.all(color:  AppColors.firebaseGrey),
        borderRadius: BorderRadius.circular(14.r),
      )
  );
}
