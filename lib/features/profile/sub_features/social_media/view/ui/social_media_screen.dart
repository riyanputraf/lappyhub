import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/profile/sub_features/social_media/view/components/social_media_body_component.dart';

import '../../../../../../shared/widgets/app_bar_custom.dart';

class SocialMediaScreen extends StatelessWidget {
  const SocialMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title:
        'Sosial Media Kami',
        onBackPressed: () => Get.back(),
      ),
      body: SocialMediaBodyComponent(),
    );
  }
}
