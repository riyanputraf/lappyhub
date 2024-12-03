import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lappyhub/features/checkout/view/components/order_summary_item_component.dart';
import 'package:lappyhub/features/home/models/laptop_detail_model.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/styles/google_text_style.dart';
import '../../../../shared/widgets/currency_format_custom.dart';

class OrderSummaryComponent extends StatelessWidget {
  const OrderSummaryComponent({
    super.key,
    required this.duration,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.laptop,
    required this.subTotalPrice,
    required this.grandTotalPrice,
    required this.serviceFee,
  });

  final int duration;
  final int serviceFee;
  final int subTotalPrice;
  final int grandTotalPrice;
  final String title;
  final DateTime? startDate;
  final DateTime? endDate;
  final LaptopDetailModel? laptop;

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
                OrderSummaryItemComponent(
                  title: 'Harga',
                  value:
                      CurrencyFormat.convertToIdr(int.parse(laptop!.price), 0),
                  subTitle: '/hari',
                ),
                OrderSummaryItemComponent(
                  title: 'Tanggal Mulai',
                  value: startDate != null
                      ? DateFormat('dd MMM yyyy').format(startDate!)
                      : '-',
                ),
                OrderSummaryItemComponent(
                  title: 'Tanggal Berakhir',
                  value: endDate != null
                      ? DateFormat('dd MMM yyyy').format(endDate!)
                      : '-',
                ),
                OrderSummaryItemComponent(
                  title: 'Durasi',
                  value: duration.toString(),
                  subTitle: ' hari',
                ),
                OrderSummaryItemComponent(
                  title: 'Sub Total Harga',
                  value: CurrencyFormat.convertToIdr(subTotalPrice, 0),
                ),
                OrderSummaryItemComponent(
                  title: 'Biaya Jasa',
                  value: CurrencyFormat.convertToIdr(serviceFee, 0),
                ),
                Divider(
                  thickness: 1,
                  color: ColorStyle.grey.withOpacity(0.25),
                ),
                OrderSummaryItemComponent(
                  title: 'Total Harga',
                  value: CurrencyFormat.convertToIdr(grandTotalPrice, 0),
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
