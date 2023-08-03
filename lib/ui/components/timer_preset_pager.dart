import 'package:flutter/material.dart';
import 'package:pomotimer/constants/colors.dart';
import 'package:pomotimer/constants/sizes.dart';

class TimerPresetPager extends StatefulWidget {
  const TimerPresetPager({
    super.key,
    required this.onTimerPresetChanged,
  });

  final void Function(int time) onTimerPresetChanged;

  @override
  State<TimerPresetPager> createState() => _TimerPresetPagerState();
}

class _TimerPresetPagerState extends State<TimerPresetPager> {
  final times = [15, 20, 25, 30, 35];
  int selectedIndex = 2;
  final defaultValueIndex = 2;

  @override
  void initState() {
    super.initState();
    widget.onTimerPresetChanged(times[defaultValueIndex]);
  }

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
          controller:
              FixedExtentScrollController(initialItem: defaultValueIndex),
          physics: FixedExtentScrollPhysics(),
          diameterRatio: 10000,
          perspective: 0.0000000001,
          onSelectedItemChanged: (value) {
            widget.onTimerPresetChanged(value);
            setState(() {
              selectedIndex = value;
            });
          },
          itemExtent: 100.0,
          children: [
            for (var index = 0; index < times.length; index++)
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
                      times[index].toString(),
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
