import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/profile/sub_features/edit_profile/controllers/edit_profile_controller.dart';

import '../../../../../../shared/styles/color_style.dart';
import '../../../../../../shared/styles/google_text_style.dart';

class EditPhotoProfileComponent extends StatelessWidget {
  const EditPhotoProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170.r,
        height: 170.r,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Stack(
          children: [
            Obx(
              () => Conditional.single(
                context: context,
                conditionBuilder: (context) =>
                    EditProfileController.to.imageFile != null,
                widgetBuilder: (context) => Image.file(
                  EditProfileController.to.imageFile!,
                  width: 170.r,
                  height: 170.r,
                  fit: BoxFit.cover,
                ),
                fallbackBuilder: (context) => CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                    EditProfileController.to.photoUrl.value,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                color: ColorStyle.primary,
                child: InkWell(
                  onTap: EditProfileController.to.pickImage,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorStyle.dark
                    ),
                    padding: EdgeInsets.only(top: 10.r, bottom: 15.r),
                    child: Text(
                      "Ubah",
                      style: GoogleTextStyle.fw400.copyWith(
                        fontSize: 14.sp,
                        color: ColorStyle.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
