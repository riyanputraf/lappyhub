import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileItemComponent extends StatelessWidget {
  const ProfileItemComponent({
    super.key,
    required this.icon,
    required this.name,
    this.onTap,
  });

  final String icon;
  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: const Color(0xffEFEEF7),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff070623),
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
