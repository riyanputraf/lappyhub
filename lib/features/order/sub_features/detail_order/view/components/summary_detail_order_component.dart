import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lappyhub/features/order/sub_features/detail_order/view/components/summary_item_detail_order_component.dart';

import '../../../../../../shared/styles/color_style.dart';
import '../../../../../../shared/styles/google_text_style.dart';
import '../../../../../../shared/widgets/currency_format_custom.dart';
import '../../models/detail_order_model.dart';

class SummaryDetailOrderComponent extends StatelessWidget {
  const SummaryDetailOrderComponent({
    super.key,
    required this.title,
    this.detailOrder,
  });

  final String title;
  final DetailOrderModel? detailOrder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleTextStyle.fw600.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.dark,
            ),
          ),
          12.verticalSpace,
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: ColorStyle.white,
            ),
            child: Column(
              children: [
                SummaryItemDetailOrderComponent(
                  title: 'Harga',
                  value: CurrencyFormat.convertToIdr(
                      int.parse(detailOrder!.laptop.price), 0),
                  subTitle: '/hari',
                ),
                SummaryItemDetailOrderComponent(
                  title: 'Tanggal Mulai',
                  value: DateFormat('dd MMM yyyy')
                      .format(DateTime.parse(detailOrder!.startDate)),
                ),
                SummaryItemDetailOrderComponent(
                  title: 'Tanggal Berakhir',
                  value: DateFormat('dd MMM yyyy')
                      .format(DateTime.parse(detailOrder!.endDate)),
                ),
                SummaryItemDetailOrderComponent(
                  title: 'Durasi',
                  value: detailOrder!.duration.toString(),
                  subTitle: ' hari',
                ),
                SummaryItemDetailOrderComponent(
                  title: 'Sub Total Harga',
                  value: CurrencyFormat.convertToIdr(detailOrder!.subPrice, 0),
                ),
                SummaryItemDetailOrderComponent(
                  title: 'Biaya Jasa',
                  value:
                      CurrencyFormat.convertToIdr(detailOrder!.serviceFee, 0),
                ),
                Divider(
                  thickness: 1,
                  color: ColorStyle.grey.withOpacity(0.25),
                ),
                SummaryItemDetailOrderComponent(
                  title: 'Total Harga',
                  value:
                      CurrencyFormat.convertToIdr(detailOrder!.grandPrice, 0),
                  valueStyle: GoogleTextStyle.fw600.copyWith(
                    fontSize: 16.sp,
                    color: ColorStyle.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
