import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/shared/controllers/global_controller.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';

import '../../../../shared/styles/color_style.dart';
import '../../constants/search_location_assets_constant.dart';

class SearchLocationScreen extends StatelessWidget {
  SearchLocationScreen({Key? key}) : super(key: key);

  final assetsConstant = SearchLocationAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Mencari Lokasimu...'.tr,
                style: GoogleTextStyle.fw400.copyWith(
                  fontSize: 22.sp,
                  color: ColorStyle.grey,
                ),
                textAlign: TextAlign.center,
              ),
              50.verticalSpacingRadius,
              Stack(
                children: [
                  Image.asset(
                    assetsConstant.mapImage,
                    width: 190.r,
                  ),
                  Padding(
                    padding: EdgeInsets.all(70.r),
                    child: Icon(
                      Icons.location_pin,
                      size: 50.r,
                    ),
                  ),
                ],
              ),
              50.verticalSpacingRadius,
              Obx(
                    () => ConditionalSwitch.single<String>(
                  context: context,
                  valueBuilder: (context) =>
                  GlobalController.to.statusLocation.value,
                  caseBuilders: {
                    'error': (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          GlobalController.to.messageLocation.value,
                          style: Get.textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        24.verticalSpacingRadius,
                        ElevatedButton(
                          onPressed: () =>
                              AppSettings.openAppSettings,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 2,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.settings,
                                color: ColorStyle.dark,
                              ),
                              16.horizontalSpaceRadius,
                              Text(
                                'Open settings'.tr,
                                style: Get.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    'success': (context) => Text(
                      GlobalController.to.address.value!,
                      style: GoogleTextStyle.fw600.copyWith(
                        fontSize: 22.sp,
                        color: ColorStyle.dark,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  },
                  fallbackBuilder: (context) =>  CircularProgressIndicator(
                    color: ColorStyle.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        onWillPop: () async => false,
      ),
    );
  }
}
