class DetailOrderLaptopSpecModel {
  final String cpu;
  final String gpu;
  final String ram;
  final String rom;
  final String baterai;
  final String kamera;
  final String fingerprint;

  DetailOrderLaptopSpecModel({
    required this.cpu,
    required this.gpu,
    required this.ram,
    required this.rom,
    required this.baterai,
    required this.kamera,
    required this.fingerprint,
  });

  factory DetailOrderLaptopSpecModel.fromJson(Map<String, dynamic> json) {
    return DetailOrderLaptopSpecModel(
      cpu: json['cpu'],
      gpu: json['gpu'],
      ram: json['ram'],
      rom: json['rom'],
      baterai: json['baterai'],
      kamera: json['kamera'],
      fingerprint: json['fingerprint'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cpu': cpu,
      'gpu': gpu,
      'ram': ram,
      'rom': rom,
      'baterai': baterai,
      'kamera': kamera,
      'fingerprint': fingerprint,
    };
  }

}