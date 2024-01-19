// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:HrmsVersions/Features/auth/register/presentation/manager/cubit/phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String? phoneNumber;
  late String? password;
  PhoneAuthCubit() : super(PhoneAuthInitial());
  Future<void> verifyPhone(String phone) async {
    emit(PhoneAuthLoading());
    phoneNumber = phone;
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        timeout: const Duration(seconds: 17),
        phoneNumber: '+2$phone',
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (error) {
      print('verifyPhone error: $error');
      emit(PhoneAuthFailed(failMessage: error.toString()));
    }
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(PhoneAuthFailed(failMessage: error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) async {
    await Hive.openBox("verificationId");
    var box = Hive.box('verificationId');
    box.put('id', verificationId);
    print('codeSent');
    emit(PhoneAuthSubmitted());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    emit(PhoneAuthTimeOut());
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    print("submitOTP");
    var box = Hive.box('verificationId');
    var verificationId = box.get('id');
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        smsCode: otpCode, verificationId: verificationId);
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneAuthVerified(user: userCredential.user));
    } catch (error) {
      print('signIn error: $error');
      emit(PhoneAuthFailed(failMessage: error.toString()));
    }
  }
}
