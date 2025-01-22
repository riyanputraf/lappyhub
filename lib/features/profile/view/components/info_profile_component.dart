import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/profile/controllers/profile_controller.dart';

import '../../../../utils/services/hive_service.dart';

class InfoProfileComponent extends StatelessWidget {
  const InfoProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            HiveService.get<String>('avatar') ?? 'avatar',
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return Text(
                ProfileController.to.name.value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff070623),
                ),
              );
            }),
            const SizedBox(height: 2),
            Obx(() {
              return Text(
                ProfileController.to.email.value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff838384),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
