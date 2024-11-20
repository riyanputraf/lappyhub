import 'package:dio/dio.dart';

import '../../../utils/services/dio_service.dart';
import '../constants/order_api_constant.dart';

class OrderRepository {
  OrderRepository._();

  var apiConstant = OrderApiConstant();

  late final Dio dio;

  OrderRepository() {
    dio = DioService.dioCall();
  }
}
