import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/profile/sub_features/rating/view/components/star_rating_component.dart';

import '../../../../../../shared/styles/color_style.dart';
import '../../../../../../shared/styles/google_text_style.dart';
import '../../../../../../shared/widgets/button_primary_custom.dart';
import '../../../../../../shared/widgets/text_form_custom.dart';

class FormRatingComponent extends StatelessWidget {
  const FormRatingComponent({
    Key? key,
    required this.feedbackController,
    required this.onRatingChanged,
    required this.onSubmit,
  }) : super(key: key);

  final TextEditingController feedbackController;
  final ValueChanged<double> onRatingChanged;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bagaimana kualitas layanan kami",
            style: GoogleTextStyle.fw500.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.dark,
            ),
          ),
          SizedBox(height: 16.h),
          RatingBar.builder(
            unratedColor: ColorStyle.grey,
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemSize: 40.w,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: ColorStyle.warning,
            ),
            onRatingUpdate: onRatingChanged,
          ),
          SizedBox(height: 25.h),
          Text(
            "Saran dan Masukan",
            style: GoogleTextStyle.fw500.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.dark,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            controller: feedbackController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Masukkan feedback Anda",
              hintStyle: GoogleTextStyle.fw400.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.grey,
              ),
              fillColor: ColorStyle.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  width: 2.w,
                  color: ColorStyle.primary,
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          ButtonPrimaryCustom(
            text: "Kirim Ulasan",
            onTap: onSubmit,
          ),
        ],
      ),
    );
  }
}

