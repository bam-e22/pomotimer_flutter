import 'package:flutter/material.dart';
import 'package:pomotimer/constants/sizes.dart';

class BoxedText extends StatelessWidget {
  const BoxedText({
    super.key,
    required this.text,
  });

  final String text;
  final double _width = 130;
  final double _height = 160;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(0, -24),
          child: Transform.scale(
            scale: 0.8,
            child: Container(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: Colors.white38,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(Sizes.size6),
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -12),
          child: Transform.scale(
            scale: 0.9,
            child: Container(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: Colors.white70,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(Sizes.size6),
              ),
            ),
          ),
        ),
        Container(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(Sizes.size6)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
              vertical: Sizes.size18,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 80,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
