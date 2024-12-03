import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/register/models/user_model.dart';

class HiveService extends GetxService {
  HiveService._();

  static final box = Hive.box('lappyHub');

  /// Fungsi simpan data pengguna yang login menggunakan Email
  static Future<void> setAuth(UserModel user) async {
    await box.put("id", user.id);
    await box.put("uid", user.uid);
    await box.put("name", user.name);
    await box.put("email", user.email);
    await box.put("avatar", user.avatar);
    await box.put("pin", user.pin);
    await box.put("password", user.password);
    await box.put("isLogin", true);
    isLoggedInStatus.value = true;

    /// Log id user
    await FirebaseAnalytics.instance.setUserId(
      id: user.id.toString(),
    );
  }

  static final isLoggedInStatus = RxBool(box.get('isLogin') == true);
  static void monitorLoginStatus() {
    box.watch(key: 'isLogin').listen((event) {
      isLoggedInStatus.value = event.value == true;
    });
  }
  static bool isUserLoggedIn() {
    return isLoggedInStatus.value;
  }

  /// Fungsi untuk mengecek apakah user masih login
  static bool isLoggedIn() {
    return box.get('isLogin') == true;
  }
  static Future<void> setIsLoggedIn(bool isLogin) async => await box.put(
    "isLogin",
    isLogin,
  );
  static Stream<bool> isLoggedInStream() {
    return box.watch(key: 'isLogin').map((event) => event.value == true);
  }

  /// Fungsi generic untuk mengambil data dari Hive
  static T? get<T>(String key) {
    return box.get(key) as T?;
  }

  /// Fungsi logout dengan menghapus session pengguna
  static Future deleteAuth() async {
    box.clear();
    box.put('isLogin', false);
    isLoggedInStatus.value = false;
  }
}
