import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/features/auth/email/screens/login_screen.dart';
import 'package:to_do_app/features/auth/email/screens/register_screen.dart';
import 'package:to_do_app/features/auth/phone/screens/otp_verification_screen.dart';
import 'package:to_do_app/features/auth/phone/screens/phone_screen.dart';
import 'package:to_do_app/features/splash_screen.dart';
import 'package:to_do_app/features/tasks/screens/tasks_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Enable Crashlytics collection (you can set it to false for testing purposes)
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  // Ensure uncaught errors are sent to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  // Initialize Firebase Messaging
  await FirebasePushNotificationService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/tasks',
        routes: <String, WidgetBuilder>{
       "/": (context) => const SplashScreen(),
          "/register": (context) => const RegisterScreen(),
          "/login": (context) => const LoginScreen(),
          "/phone": (context) => const PhoneScreen(),
          "/otp": (context) => const OTPVerficationScreen(),
          "/tasks": (context) => const TasksScreen(),
        },
      ),
    );
  }
}
