import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../utils/services/dio_service.dart';
import '../constants/register_api_constant.dart';
import '../constants/register_assets_constant.dart';
import '../models/user_model.dart';

class RegisterRepository {
  RegisterRepository._();

  var apiConstant = RegisterApiConstant();
  final assetsConstant = RegisterAssetsConstant();
  late final Dio dio;

  RegisterRepository() {
    dio = DioService.dioCall();
  }

  // URL endpoint di MockAPI
  final String endpoint = "/users";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel?> register(
    String email,
    String password,
    String name,
    String pin,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Set display name di Firebase Auth
      await userCredential.user!.updateDisplayName(name);

      User user = userCredential.user!;

      UserModel newUser = UserModel(
        id: '',
        uid: user.uid,
        email: user.email!,
        name: name,
        pin: pin,
        password: password,
        avatar: assetsConstant.personIcon, // URL avatar default
      );

      // Kirim data ke MockAPI menggunakan POST
      final response = await dio.post(
        endpoint,
        data: newUser.toJson(),
      );

      // Cek respons dari server
      if (response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      } else {
        await Sentry.captureException(
          response.statusCode,
        );
        Get.snackbar("Error", "Failed to register user");
        return null;
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Get.snackbar(
          "Error",
          "Email yang anda masukkan tidak sesuai format",
          backgroundColor: ColorStyle.danger,
          duration: Duration(seconds: 4),
        );
        return null;

      } else if (e.code == 'weak-password') {
        Get.snackbar(
          "Error",
          "Password anda masih terlalu lemah, harap ubah password anda",
          backgroundColor: ColorStyle.danger,
        );
        return null;

      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Error",
          "Akun sudah ada, harap daftarkan akun lain",
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
      log(exception.toString());
      return null;
    }
  }
}
