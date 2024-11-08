import 'package:geolocator/geolocator.dart';

class LocationResult {
  final bool success;
  final Position? position;
  final String? address;
  final String? message;

  LocationResult({
    required this.success,
    this.position,
    this.address,
    this.message,
  });

  factory LocationResult.success({required Position position, required String address}) {
    return LocationResult(
      success: true,
      position: position,
      address: address,
    );
  }

  factory LocationResult.error({required String message}) {
    return LocationResult(
      success: false,
      message: message,
    );
  }
}