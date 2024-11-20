import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/checkout/sub_features/success_checkout/controllers/checkout_success_checkout_controller.dart';
import 'package:lappyhub/features/checkout/sub_features/success_checkout/view/components/header_success_component.dart';
import 'package:lappyhub/features/checkout/sub_features/success_checkout/view/components/laptop_order_information_component.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/widgets/button_primary_custom.dart';
import 'package:lappyhub/shared/widgets/button_secondary_custom.dart';

import '../../../../../main/controllers/main_controller.dart';
import '../../../../constants/checkout_assets_constant.dart';

class SuccessCheckoutScreen extends StatelessWidget {
  SuccessCheckoutScreen({Key? key}) : super(key: key);

  final assetsConstant = CheckoutAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.softGrey,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          80.verticalSpace,
          HeaderSuccesComponent(
            title: 'Pesanan',
            status: 'Berhasil',
            subTitle: 'Periksa Pesananmu',
          ),
          50.verticalSpace,
          LaptopOrderInformationComponent(
            laptop: CheckoutSuccessCheckoutController.to.detailLaptop.value,
          ),
          50.verticalSpace,
          ButtonPrimaryCustom(
            text: 'Sewa Laptop Lain',
            onTap: () {
              MainController.to.updateIndex(0);
              // Navigasi kembali ke halaman home
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          12.verticalSpace,
          ButtonSecondaryCustom(
            text: 'Lihat Pesanan Saya',
            onTap: () {
              MainController.to.updateIndex(1);
              // Navigasi kembali ke halaman order
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}
