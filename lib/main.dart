import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lappyhub/shared/bindings/global_binding.dart';
import 'package:lappyhub/utils/services/hive_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:lappyhub/configs/routes/route.dart';

import 'configs/pages/page.dart';
import 'configs/themes/theme.dart';
import 'firebase_options.dart';
import 'utils/services/sentry_services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  /// Change your options.dns with your project !!!!
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Hive.initFlutter();
      await Hive.openBox('lappyHub');
      // Monitor perubahan login status
      HiveService.monitorLoginStatus();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      configLoading();

      /// Change your options.dns with your project !!!!
      await SentryFlutter.init(
        (options) {
          options.dsn =
              'https://b079d44543128d614ca1aa715543669a@o4508061537599488.ingest.us.sentry.io/4508061538844672';
          options.tracesSampleRate = 1.0;
          options.beforeSend = filterSentryErrorBeforeSend;
          options.profilesSampleRate = 1.0;
        },
        appRunner: () => runApp(const MyApp()),
      );
    },
    (error, stack) {
      Sentry.captureException(error, stackTrace: stack);
    },
  );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.blue
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Screen Util Init berdasarkan ukuran iphone xr
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'LappyHub',
          debugShowCheckedModeBanner: false,
          locale: const Locale('id'),
          fallbackLocale: const Locale('id'),
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('id'),
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialBinding: GlobalBinding(),
          initialRoute: Routes.splashRoute,
          theme: themeLight,
          defaultTransition: Transition.native,
          getPages: Pages.pages,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
