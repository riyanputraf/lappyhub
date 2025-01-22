import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRatingComponent extends StatelessWidget {
  final int initialRating;
  final ValueChanged<int> onRatingChanged;

  const StarRatingComponent({
    Key? key,
    this.initialRating = 0,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () => onRatingChanged(index + 1),
          icon: Icon(
            Icons.star,
            size: 32.r,
            color: index < initialRating ? Colors.amber : Colors.grey[400],
          ),
        );
      }),
    );
  }
}
