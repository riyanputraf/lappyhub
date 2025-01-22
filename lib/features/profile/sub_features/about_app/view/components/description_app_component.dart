import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionAppComponent extends StatelessWidget {
  const DescriptionAppComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deskripsi Aplikasi',
          style: Get.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'LappyHub adalah aplikasi mobile yang menawarkan layanan penyewaan '
          'laptop untuk memenuhi kebutuhan pengguna seperti pelajar yang '
          'membutuhkan laptop baru tanpa harus membeli laptop baru.',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 20),
        Text(
          'Tujuan Aplikasi',
          style: Get.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Memberikan kemudahan bagi pengguna yang memerlukan laptop '
          'dengan menyediakan berbagai macam laptop untuk kebutuhan sementara, '
          'tanpa perlu mengeluarkan biaya besar untuk pembelian. ',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
