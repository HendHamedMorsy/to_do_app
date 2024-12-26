import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/components/app_button.dart';
import 'package:to_do_app/core/components/otp_widget.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class OTPVerficationScreen extends StatefulWidget {
  const OTPVerficationScreen({super.key});

  @override
  State<OTPVerficationScreen> createState() => _OTPVerficationScreenState();
}

class _OTPVerficationScreenState extends State<OTPVerficationScreen> {
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
                  height:42.h,
                    ),
                    Center(
                      child: Image.asset(
                        AppAssets.otp,
                        width: 250,
                        height: 250,
                      ),
                    ),
                   SizedBox(
                  height:24.h,
                    ),
                    const Text("Verify phone number",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,),),
                    SizedBox(height: 8.h,),
                    Text("Enter OTP that has been send to your phone number",textAlign: TextAlign.center,style: TextStyle( fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.black.withOpacity(0.5)),),
                        SizedBox(
                      height:42.h,
                    ),
                    OTPWidget(),
                     SizedBox(
                  height:120.h,
                    ),
                    AppButton(
                      label: "Verify Phone Number",
                      onPressed: () {},
                    ),
                    SizedBox(height: 16.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn’t receive code ?",
                          style:
                              TextStyle(color: AppColors.black.withOpacity(0.3),fontWeight: FontWeight.w700,fontSize: 14,),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Resend OTP",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,fontSize: 14,
                                  decorationColor: AppColors.firebaseAmber,
                                  decoration: TextDecoration.underline,
                                  color: AppColors.firebaseAmber),
                            )),
                      ],
                    ),
                
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
