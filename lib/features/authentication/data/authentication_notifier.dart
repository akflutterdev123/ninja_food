import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ninjaa/utils/common_library.dart';

final authNotifierProvider = ChangeNotifierProvider<AuthNotifier>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return AuthNotifier(firebaseAuth);
});

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

class AuthNotifier extends ChangeNotifier {
  final FirebaseAuth _auth;
  User? user;

  AuthNotifier(this._auth) {
    // Listen to auth state changes and update `user` property
    _auth.authStateChanges().listen((user) {
      log("Is authnticated user is ${user.toString()}");
      this.user = user;
      notifyListeners(); // Notify listeners about the change
    });
  }

  // Check if the user is currently logged in
  bool get isLoggedIn => user != null;

  // Sign in with a phone number and send OTP
  Future<void> signInWithPhoneNumber(String phoneNumber,
      {required Function(PhoneAuthCredential) onVerificationCompleted,
      required void Function(String, int?) codeSent,
      required void Function(String) onVerificationFailed}) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        onVerificationCompleted(credential);

        notifyListeners();
      },
      verificationFailed: (FirebaseAuthException e) {
        onVerificationFailed(e.message ?? "");
      },
      codeSent: (String verificationId, int? resendToken) async {
        codeSent(verificationId, resendToken);
        // Store verificationId for later use
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout if needed
      },
    );
  }

  Future<bool> verifyOtp(
      {required String verificationId, required String smsCode}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    log("Creds is ${credential.toString()}");
    if (credential.token != null) {
      await _auth.signInWithCredential(credential);
      notifyListeners();
      return true;
    } else {
      await _auth.signInWithCredential(credential);
      notifyListeners();
      return false;
    }
  }

  Future<void> updateUserInfo() async {}

  // Sign out the user and notify listeners
  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }
}
