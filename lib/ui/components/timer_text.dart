import 'package:flutter/material.dart';
import 'package:pomotimer/constants/gaps.dart';
import 'package:pomotimer/constants/sizes.dart';
import 'package:pomotimer/ui/components/boxed_text.dart';

class TimerText extends StatelessWidget {
  const TimerText({
    super.key,
    required this.duration,
    required this.showDescription,
    required this.description,
  });

  final Duration duration;
  final bool showDescription;
  final String description;

  String formatMinutes(Duration duration) {
    return duration.toString().split(".").first.substring(2, 4);
  }

  String formatSeconds(Duration duration) {
    return duration.toString().split(".").first.substring(5, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gaps.v60,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BoxedText(
              text: formatMinutes(duration),
            ),
            Transform.translate(
              offset: const Offset(0, -10),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.size6),
                child: Text(
                  ':',
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.white54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            BoxedText(
              text: formatSeconds(duration),
            ),
          ],
        ),
        Gaps.v20,
        AnimatedOpacity(
          opacity: showDescription ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: Text(
            description,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white60),
          ),
        )
      ],
    );
  }
}
