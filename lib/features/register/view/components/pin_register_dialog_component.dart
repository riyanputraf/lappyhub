import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/styles/google_text_style.dart';

class PinRegisterDialogComponent extends StatefulWidget {
  final RxString pin;

  const PinRegisterDialogComponent({
    Key? key,
    required this.pin,
  }) : super(key: key);

  @override
  State<PinRegisterDialogComponent> createState() =>
      _PinRegisterDialogComponentState();
}

class _PinRegisterDialogComponentState
    extends State<PinRegisterDialogComponent> {
  final RxBool obscure = RxBool(true);
  final RxnString errorText = RxnString();
  late final TextEditingController controller;
  int tries = 0;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  Future<void> processPin(String? pin) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print("Pin: ${controller.text}");
    Get.back(result: controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 34.w,
      height: 50.h,
      textStyle: Get.textTheme.titleLarge,
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // title
          Text(
            'Registrasi PIN Anda',
            style: GoogleTextStyle.fw600.copyWith(
              fontSize: 22.sp,
              color: ColorStyle.softDark,
            ),
          ),

          // subtitle
          Text(
            'Masukan kode PIN',
            style: GoogleTextStyle.fw400
                .copyWith(fontSize: 16.sp, color: ColorStyle.grey),
          ),
          24.verticalSpacingRadius,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Expanded(
                  // pin input
                  child: Pinput(
                    controller: controller,
                    showCursor: false,
                    length: 6,
                    autofocus: true,
                    separatorBuilder: (index) {
                      // Hanya menambahkan separator setelah index ke-2 dan ke-4
                      if (index == 1 || index == 3) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: ColoredBox(
                            color: Colors.black,
                            child: SizedBox(width: 9.w, height: 2.h),
                          ),
                        );
                      }
                      // Kembalikan SizedBox dengan ukuran 0 jika tidak ada separator di posisi lain
                      return SizedBox.shrink();
                    },
                    closeKeyboardWhenCompleted: false,
                    defaultPinTheme: defaultPinTheme,
                    obscureText: obscure.value,
                    onSubmitted: processPin,
                    onCompleted: processPin,
                  ),
                ),
              ),
              10.horizontalSpace,
              // show pin button
              Obx(
                () => InkWell(
                  radius: 24.r,
                  child: Icon(
                    obscure.value ? Icons.visibility_off : Icons.visibility,
                    color: ColorStyle.grey,
                    size: 20.r,
                  ),
                  onTap: () {
                    obscure.value = !obscure.value;
                  },
                ),
              ),
            ],
          ),

          /// Pesan error
          Obx(
            () => errorText.value != null
                ? Padding(
                    padding: EdgeInsets.only(
                      left: 15.r,
                      right: 15.r,
                      top: 10.r,
                    ),
                    child: Text(
                      errorText.value!,
                      style: Get.textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
