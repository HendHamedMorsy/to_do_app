import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // crashlytics
final FirebaseCrashlyticsService _crashlyticsService = FirebaseCrashlyticsService();

  Future<Result<User>> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.success(userCredential.user);
    } catch (e) {
      _crashlyticsService.logAuthError(e.message ?? 'Unknown error', method: 'Email/Password Sign-In');
      _crashlyticsService.logError(e, stackTrace);
      return Result.failure(e.toString());
    }
  }
    Future<Result<User>> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.success(userCredential.user);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }


  Future<Result<User>> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return Result.failure("Google sign-in cancelled by user.");
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return Result.success(userCredential.user);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

// Generic Result class for success or failure
class Result<T> {
  final T? data;
  final String? error;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;

  bool get isSuccess => data != null;
}
