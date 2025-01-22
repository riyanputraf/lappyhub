import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SocialMediaBodyComponent extends StatelessWidget {
  const SocialMediaBodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(
        url: WebUri('https://asani.co.id/sewa-laptop-malang/'),
      ),
    );
  }
}
