import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../utils/services/hive_service.dart';
import '../constants/profile_api_constant.dart';

class ProfileRepository {
  ProfileRepository._();

  var apiConstant = ProfileApiConstant();
  late final FirebaseAuth firebaseAuth;

  ProfileRepository() {
    firebaseAuth = FirebaseAuth.instance;;
  }

  Future<bool> logout() async {
    try {
      // Logout dari Firebase
      await firebaseAuth.signOut();

      // Hapus data sesi dari Hive
      await HiveService.deleteAuth();

      return true;
    } catch (exception, stackTrace) {
      log('Fetch Error: ${exception.toString()}');
      log('Stack Trace: ${stackTrace.toString()}');
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      return false;
    }
  }
}
