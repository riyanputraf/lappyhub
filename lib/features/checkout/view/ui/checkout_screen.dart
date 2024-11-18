import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/checkout/controllers/checkout_controller.dart';
import 'package:lappyhub/features/checkout/view/components/checkout_laptop_card_component.dart';
import 'package:lappyhub/features/checkout/view/components/choose_date_component.dart';
import 'package:lappyhub/features/checkout/view/components/dropdown_rent_need_component.dart';
import 'package:lappyhub/features/checkout/view/components/order_summary_component.dart';
import 'package:lappyhub/features/checkout/view/components/payment_method_component.dart';
import 'package:lappyhub/features/home/models/laptop_detail_model.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/widgets/app_bar_custom.dart';
import 'package:lappyhub/shared/widgets/button_primary_custom.dart';

import '../../constants/checkout_assets_constant.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);

  final assetsConstant = CheckoutAssetsConstant();

  @override
  Widget build(BuildContext context) {
    // Passing argument
    final arguments = Get.arguments;
    final LaptopDetailModel laptop = arguments['laptop'];

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
              laptop: laptop,
            ),
            20.verticalSpace,
            ChooseDateComponent(
              icon: assetsConstant.calendarIcon,
              hint: 'Pilih tanggal',
              label: 'Tanggal Mulai Sewa',
              controller: CheckoutController.to.edtStartDate,
              onTap: () {
                CheckoutController.to.pickDate(
                  CheckoutController.to.edtStartDate,
                  true,
                );
              },
            ),
            20.verticalSpace,
            ChooseDateComponent(
              icon: assetsConstant.calendarIcon,
              hint: 'Pilih tanggal',
              label: 'Tanggal Akhir Sewa',
              controller: CheckoutController.to.edtEndDate,
              onTap: () {
                CheckoutController.to.pickDate(
                  CheckoutController.to.edtEndDate,
                  false,
                );
              },
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
            PaymentMethodComponent(
              icon: assetsConstant.paymentIcon,
              hint: 'Pilih Metode Pembayaran',
              label: 'Metode Pembayaran',
              controller: CheckoutController.to.edtPayment,
              onTap: (){},
            ),
            20.verticalSpace,
            Obx(
              () {
                return OrderSummaryComponent(
                  title: 'Rincian Pemesanan',
                  duration: CheckoutController.to.durationDays.value,
                  startDate: CheckoutController.to.startDate.value,
                  endDate: CheckoutController.to.endDate.value,
                  laptop: laptop,
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
          onTap: () {},
        ),
      ),
    );
  }
}
