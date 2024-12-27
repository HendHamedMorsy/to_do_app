import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class FirebaseCrashlyticsService {
  // Singleton pattern to ensure we have a single instance
  static final FirebaseCrashlyticsService _instance = FirebaseCrashlyticsService._internal();
  
  factory FirebaseCrashlyticsService() => _instance;
  
  FirebaseCrashlyticsService._internal();

  // Log a custom message to Firebase Crashlytics
  void logMessage(String message) {
    FirebaseCrashlytics.instance.log(message);
  }

  // Log an error to Firebase Crashlytics (non-fatal)
  void logError(Exception exception, StackTrace stackTrace) {
    FirebaseCrashlytics.instance.recordError(exception, stackTrace);
  }

  // Log a fatal crash
  void logFatalCrash() {
    FirebaseCrashlytics.instance.crash();
  }

  // Log authentication-related errors (login/register)
  void logAuthError(String errorMessage, {String? method}) {
    FirebaseCrashlytics.instance.setCustomKey('auth_method', method ?? 'unknown');
    FirebaseCrashlytics.instance.log('Authentication error: $errorMessage');
  }
}
