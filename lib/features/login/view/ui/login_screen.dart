import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/login/view/components/footer_component.dart';
import 'package:lappyhub/features/login/view/components/form_login_component.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/widgets/button_primary_custom.dart';

import '../../../../shared/styles/google_text_style.dart';
import '../../constants/login_assets_constant.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final assetsConstant = LoginAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorStyle.softGrey,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 50.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    assetsConstant.lappyHeader,
                    width: 270.w,
                    height: 91.h,
                  ),
                ),
                50.verticalSpace,
                Text(
                  'Login Akun',
                  style: GoogleTextStyle.fw700.copyWith(
                    color: ColorStyle.dark,
                    fontSize: 24.sp,
                  ),
                ),
                30.verticalSpace,
                FormLoginComponent(),
                30.verticalSpace,
                ButtonPrimaryCustom(
                  text: 'Login Akun',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: FooterComponent(),
      ),
    );
  }
}
