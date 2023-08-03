import 'package:flutter/material.dart';
import 'package:pomotimer/constants/colors.dart';
import 'package:pomotimer/constants/sizes.dart';

class TimerPresetPager extends StatefulWidget {
  const TimerPresetPager({
    super.key,
    required this.presets,
    required this.defaultPresetIndex,
    required this.onTimerPresetChanged,
  });

  final List<Duration> presets;
  final int defaultPresetIndex;
  final void Function(Duration duration) onTimerPresetChanged;

  @override
  State<TimerPresetPager> createState() => _TimerPresetPagerState();
}

class _TimerPresetPagerState extends State<TimerPresetPager> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: [
            Colors.white.withOpacity(0.2),
            Colors.white,
            Colors.white.withOpacity(0.2),
          ],
        ).createShader(bounds);
      },
      child: RotatedBox(
        quarterTurns: -1,
        child: ListWheelScrollView(
          controller: FixedExtentScrollController(
              initialItem: widget.defaultPresetIndex),
          physics: const FixedExtentScrollPhysics(),
          diameterRatio: 10000,
          perspective: 0.0000000001,
          onSelectedItemChanged: (index) {
            widget.onTimerPresetChanged(widget.presets[index]);
            setState(() {
              selectedIndex = index;
            });
          },
          itemExtent: 100.0,
          children: [
            for (var index = 0; index < widget.presets.length; index++)
              RotatedBox(
                quarterTurns: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size18),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedIndex == index ? Colors.white : null,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(Sizes.size4),
                      border:
                          Border.all(color: Colors.white, width: Sizes.size2),
                    ),
                    child: Text(
                      widget.presets[index].inMinutes.toString(),
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: selectedIndex == index
                                    ? MyColors.carminePink
                                    : Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
