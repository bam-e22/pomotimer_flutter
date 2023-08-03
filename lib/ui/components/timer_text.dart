import 'package:flutter/material.dart';
import 'package:pomotimer/constants/gaps.dart';

class TimerText extends StatelessWidget {
  const TimerText({
    super.key,
    required this.duration,
    required this.description,
  });

  final Duration duration;
  final String description;

  String format(Duration duration) {
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gaps.v20,
        Text(
          format(duration),
          style: const TextStyle(
            fontSize: 96,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          description,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white60),
        )
      ],
    );
  }
}
