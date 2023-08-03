import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
    required this.isRunning,
    required this.size,
    required this.onPressed,
  });

  final bool isRunning;
  final double size;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: size,
      onPressed: onPressed,
      icon: Container(
        width: size * 1.5,
        height: size * 1.5,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black12,
        ),
        child: Icon(
          isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
