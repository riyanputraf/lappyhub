class PaymentModel {
  final String id;
  final String name;
  final String icon;
  bool isSelected;

  PaymentModel({
    required this.id,
    required this.name,
    required this.icon,
    this.isSelected = false,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      isSelected: json['status'] == 1,
    );
  }
}
