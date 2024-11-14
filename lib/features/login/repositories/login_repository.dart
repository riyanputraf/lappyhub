import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../shared/styles/color_style.dart';
import '../../../utils/services/dio_service.dart';
import '../../register/models/user_model.dart';
import '../constants/login_api_constant.dart';

class LoginRepository {
  LoginRepository._();

  var apiConstant = LoginApiConstant();

  late final Dio dio;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final String endpoint = "/users";

  LoginRepository() {
    dio = DioService.dioCall();
  }

  Future<UserModel?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = userCredential.user!;

      final response =
          await DioService.dioCall().get('$endpoint?uid=${user.uid}');

      if (response.statusCode == 200 && response.data.isNotEmpty) {
        return UserModel.fromJson(response.data[0]);
      } else {
        await Sentry.captureException(
          response.statusCode,
        );
        Get.snackbar("Error", "User data not found in MockAPI");
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        Get.snackbar(
          "Error",
          "Email atau password anda salah",
          backgroundColor: ColorStyle.danger,
        );
        return null;
      } else if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error",
          "Email anda tidak ditemukan",
          backgroundColor: ColorStyle.danger,
        );
        return null;
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error",
          "Password anda salah",
          backgroundColor: ColorStyle.danger,
        );
        return null;
      }
      log(e.toString());
      return null;
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      Get.snackbar("Error", exception.toString());
      return null;
    }
  }
}
