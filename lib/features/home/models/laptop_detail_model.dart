import 'laptop_spec_model.dart';

class LaptopDetailModel {
  final String id;
  final String name;
  final String image;
  final String price;
  final String category;
  final bool isAvailable;
  final double rating;
  final LaptopSpecModel specs;

  LaptopDetailModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    required this.isAvailable,
    required this.rating,
    required this.specs,
  });

  factory LaptopDetailModel.fromJson(Map<String, dynamic> json) {
    return LaptopDetailModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      category: json['category'],
      isAvailable: json['is_available'],
      rating: json['rating']?.toDouble() ?? 0.0,
      specs: LaptopSpecModel.fromJson(json['specs']),
    );
  }
}