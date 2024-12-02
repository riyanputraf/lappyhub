import 'order_laptop_model.dart';

class OrderModel {
  final String id;
  final String orderDate;
  final int status;
  final OrderLaptopModel laptop;
  final String startDate;
  final String endDate;
  final int subPrice;
  final int grandPrice;
  final int duration;
  final int serviceFee;
  final String paymentMethod;
  final String rentNeed;
  final String userId;

  OrderModel({
    required this.id,
    required this.orderDate,
    required this.status,
    required this.laptop,
    required this.startDate,
    required this.endDate,
    required this.subPrice,
    required this.grandPrice,
    required this.duration,
    required this.serviceFee,
    required this.paymentMethod,
    required this.rentNeed,
    required this.userId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      orderDate: json['order_date'],
      status: json['status'],
      laptop: OrderLaptopModel.fromJson(json['laptops']),
      startDate: json['start_date'],
      endDate: json['end_date'],
      subPrice: json['sub_price'],
      grandPrice: json['grand_price'],
      duration: json['duration'],
      serviceFee: json['service_fee'],
      paymentMethod: json['payment_method'],
      rentNeed: json['rent_need'],
      userId: json['userId'],
    );
  }
}
