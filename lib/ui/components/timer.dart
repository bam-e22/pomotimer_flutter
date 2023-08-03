import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  const Timer({
    super.key,
    required this.initialDuration,
  });

  final Duration initialDuration;

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  String format(Duration duration) {
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          format(widget.initialDuration),
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
