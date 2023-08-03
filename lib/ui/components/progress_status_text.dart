import 'package:flutter/material.dart';
import 'package:pomotimer/constants/gaps.dart';

class ProgressStatusText extends StatelessWidget {
  const ProgressStatusText({
    super.key,
    required this.current,
    required this.max,
    required this.title,
  });

  final int current;
  final int max;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$current/$max',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white30,
                fontWeight: FontWeight.w600,
              ),
        ),
        Gaps.v10,
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
        )
      ],
    );
  }
}
