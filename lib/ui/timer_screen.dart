import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomotimer/constants/colors.dart';
import 'package:pomotimer/constants/sizes.dart';
import 'package:pomotimer/ui/components/play_button.dart';
import 'package:pomotimer/ui/components/progress_status_text.dart';
import 'package:pomotimer/ui/components/timer.dart';
import 'package:pomotimer/ui/components/timer_preset_pager.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int round = 0;
  final int maxRound = 4;
  int goal = 0;
  final int maxGoal = 12;
  bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Text(
              'POMOTIMER',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Timer(
              initialDuration: Duration(minutes: 25),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: TimerPresetPager(
              onTimerPresetChanged: (time) {
                print("time= $time");
              },
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Center(
              child: PlayButton(
                isRunning: isRunning,
                size: 60.0,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ProgressStatusText(
                          current: round,
                          max: maxRound,
                          title: 'ROUND',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ProgressStatusText(
                          current: goal,
                          max: maxGoal,
                          title: 'GOAL',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
