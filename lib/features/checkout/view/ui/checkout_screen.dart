import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/checkout/controllers/checkout_controller.dart';
import 'package:lappyhub/features/checkout/view/components/checkout_laptop_card_component.dart';
import 'package:lappyhub/features/checkout/view/components/dropdown_rent_need_component.dart';
import 'package:lappyhub/features/checkout/view/components/form_checkout_component.dart';
import 'package:lappyhub/features/checkout/view/components/summary_checkout_component.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/widgets/app_bar_custom.dart';
import 'package:lappyhub/shared/widgets/button_primary_custom.dart';
import 'package:lappyhub/utils/services/hive_service.dart';

import '../../constants/checkout_assets_constant.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);

  final assetsConstant = CheckoutAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.softGrey,
      appBar: AppBarCustom(
        title: 'Checkout',
        onBackPressed: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.verticalSpace,
            CheckoutLaptopCardComponent(
              laptop: CheckoutController.to.detailLaptop.value,
            ),
            20.verticalSpace,
            FormCheckoutComponent(
              assetsConstant: assetsConstant,
            ),
            20.verticalSpace,
            Obx(
              () {
                return DropdownRentNeedComponent(
                  title: 'Keperluan sewa',
                  selectedValue: CheckoutController.to.selectedRentNeed.value,
                  items: CheckoutController.to.rentNeedOptions,
                  onChanged: CheckoutController.to.onRentNeedChanged,
                  iconPath: assetsConstant.rentNeedIcon,
                );
              },
            ),
            20.verticalSpace,
            Obx(
              () {
                return SummaryCheckoutComponent(
                  title: 'Rincian Pemesanan',
                  duration: CheckoutController.to.durationDays.value,
                  startDate: CheckoutController.to.startDate.value,
                  endDate: CheckoutController.to.endDate.value,
                  laptop: CheckoutController.to.detailLaptop.value,
                  subTotalPrice: CheckoutController.to.subTotalPrice.value,
                  serviceFee: CheckoutController.to.serviceFee,
                  grandTotalPrice: CheckoutController.to.grandTotalPrice.value,
                );
              },
            ),
            20.verticalSpace,
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          bottom: 30.h,
        ),
        child: ButtonPrimaryCustom(
          text: 'Checkout Sekarang',
          onTap: () {
            log('Date time Now: ${DateTime.now().toString()}');
            String? idUser = HiveService.get<String>('id');
            if (idUser != null) {
              CheckoutController.to.createOrder(
                  CheckoutController.to.detailLaptop.value!, idUser);
            }
          },
        ),
      ),
    );
  }
}
