
import 'detail_order_laptop_spec_model.dart';

class DetailOrderLaptopModel {
  final String id;
  final String name;
  final String image;
  final String price;
  final String category;
  final bool isAvailable;
  final double rating;
  final DetailOrderLaptopSpecModel specs;

  DetailOrderLaptopModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    required this.isAvailable,
    required this.rating,
    required this.specs,
  });

  factory DetailOrderLaptopModel.fromJson(Map<String, dynamic> json) {
    return DetailOrderLaptopModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      category: json['category'],
      isAvailable: json['is_available'],
      rating: json['rating']?.toDouble() ?? 0.0,
      specs: DetailOrderLaptopSpecModel.fromJson(json['specs']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'category': category,
      'is_available': isAvailable,
      'rating': rating,
      'specs': specs.toJson(),
    };
  }
}