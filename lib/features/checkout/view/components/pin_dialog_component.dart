import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';
import 'package:pinput/pinput.dart';

class PinDialogComponent extends StatefulWidget {
  const PinDialogComponent({
    super.key,
    required this.pin,
  });

  final String pin;

  @override
  State<PinDialogComponent> createState() => _PinDialogComponentState();
}

class _PinDialogComponentState extends State<PinDialogComponent> {
  final RxBool obscure = RxBool(true);
  final RxnString errorText = RxnString();
  final TextEditingController controller = TextEditingController();
  int tries = 0;

  Future<void> processPin(String? pin) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (pin == widget.pin) {
      // if pin is correct close the dialog
      Get.back<bool>(result: true);
    } else {
      // if pin incorrect, type again
      tries++;

      if (tries >= 3) {
        // if tries more than 3, close the dialog
        Get.back<bool>(result: false);
      } else {
        // show how many tries user have left
        controller.clear();
        errorText.value = 'PIN wrong! ${3 - tries} chances left.';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 34.w,
      height: 50.h,
      textStyle: GoogleTextStyle.fw600.copyWith(
        fontSize: 22.sp,
        color: ColorStyle.dark,
      ),
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: BoxDecoration(
        border: Border.all(color: ColorStyle.primary),
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
            'Verifikasi Pesanan',
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
                    padding:
                        EdgeInsets.only(left: 15.r, right: 15.r, top: 10.r),
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
