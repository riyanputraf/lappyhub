import 'package:lappyhub/features/home/models/laptop_detail_model.dart';

class CheckoutOrderModel {
  final String userId;
  final String startDate;
  final String endDate;
  final int subPrice;
  final int grandPrice;
  final int duration;
  final int serviceFee;
  final String paymentMethod;
  final String rentNeed;
  final int status;
  final LaptopDetailModel laptop;

  CheckoutOrderModel({
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.subPrice,
    required this.grandPrice,
    required this.duration,
    required this.serviceFee,
    required this.paymentMethod,
    required this.rentNeed,
    required this.status,
    required this.laptop,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'start_date': startDate,
      'end_date': endDate,
      'sub_price': subPrice,
      'grand_price': grandPrice,
      'duration': duration,
      'service_fee': serviceFee,
      'payment_method': paymentMethod,
      'rent_need': rentNeed,
      'status': status,
      'laptops': laptop.toJson(),
    };
  }
}
