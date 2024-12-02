import 'order_spec_laptop_model.dart';

class OrderLaptopModel {
  final String id;
  final String name;
  final String image;
  final String price;
  final String category;
  final bool isAvailable;
  final double rating;
  final OrderSpecLaptopModel specs;

  OrderLaptopModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    required this.isAvailable,
    required this.rating,
    required this.specs,
  });

  factory OrderLaptopModel.fromJson(Map<String, dynamic> json) {
    return OrderLaptopModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      category: json['category'],
      isAvailable: json['is_available'],
      rating: json['rating']?.toDouble() ?? 0.0,
      specs: OrderSpecLaptopModel.fromJson(json['specs']),
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