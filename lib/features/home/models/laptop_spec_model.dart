class LaptopSpecModel {
  final String cpu;
  final String gpu;
  final String ram;
  final String rom;
  final String baterai;
  final String kamera;
  final String fingerprint;

  LaptopSpecModel({
    required this.cpu,
    required this.gpu,
    required this.ram,
    required this.rom,
    required this.baterai,
    required this.kamera,
    required this.fingerprint,
  });

  factory LaptopSpecModel.fromJson(Map<String, dynamic> json) {
    return LaptopSpecModel(
      cpu: json['cpu'],
      gpu: json['gpu'],
      ram: json['ram'],
      rom: json['rom'],
      baterai: json['baterai'],
      kamera: json['kamera'],
      fingerprint: json['fingerprint'],
    );
  }
}