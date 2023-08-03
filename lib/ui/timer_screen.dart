import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomotimer/constants/sizes.dart';
import 'package:pomotimer/ui/components/play_button.dart';
import 'package:pomotimer/ui/components/progress_status_text.dart';
import 'package:pomotimer/ui/components/timer_preset_pager.dart';
import 'package:pomotimer/ui/components/timer_text.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _round = 0;
  final int _maxRound = 4;
  int _goal = 0;
  final int _maxGoal = 12;
  bool _isRunning = false;
  late Timer _timer;
  final List<Duration> _presets = [
    const Duration(seconds: 15),
    const Duration(seconds: 20),
    const Duration(seconds: 25),
    const Duration(seconds: 30),
    const Duration(seconds: 35),
  ];
  final int _defaultPresetIndex = 2;
  late Duration _durationPreset = _presets[_defaultPresetIndex];
  late Duration _duration = _durationPreset;
  final Duration _restDuration = const Duration(seconds: 5);
  bool _isWorking = true;

  void _onTick(Timer timer) {
    if (_duration.inSeconds == 0) {
      setState(() {
        _onTimerEnd();
      });
    } else {
      setState(() {
        _duration = Duration(seconds: _duration.inSeconds - 1);
      });
    }
  }

  void _onTimerEnd() {
    setState(() {
      if (_isWorking) {
        _duration = _restDuration;
        _increaseRound();
      } else {
        _duration = _durationPreset;
      }
      _isWorking = !_isWorking;
    });
  }

  void _increaseRound() {
    if (_round < _maxRound) {
      _round += 1;
    } else {
      _round = 0;
      _increaseGoal();
    }
  }

  void _increaseGoal() {
    if (_goal < _maxGoal) {
      _goal += 1;
    } else {
      _isRunning = false;
      _goal = 0;
    }
  }

  void _onStartPressed() {
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
    setState(() {
      _isRunning = true;
    });
  }

  void _onPausePressed() {
    _timer.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  // reset all
  void _onTimerPresetChanged(Duration duration) {
    _timer.cancel();
    _durationPreset = duration;
    _duration = duration;
    _isRunning = false;
    _isWorking = true;
    _round = 0;
    _goal = 0;
    setState(() {});
  }

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
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: TimerText(
              duration: _duration,
              description: _isRunning
                  ? (_isWorking ? "Work on your task!" : "take a rest...")
                  : "",
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: TimerPresetPager(
              presets: _presets,
              defaultPresetIndex: _defaultPresetIndex,
              onTimerPresetChanged: (Duration duration) {
                _onTimerPresetChanged(duration);
              },
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Center(
              child: PlayButton(
                isRunning: _isRunning,
                size: 60.0,
                onPressed: () {
                  if (_isRunning) {
                    _onPausePressed();
                  } else {
                    _onStartPressed();
                  }
                },
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
                          current: _round,
                          max: _maxRound,
                          title: 'ROUND',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ProgressStatusText(
                          current: _goal,
                          max: _maxGoal,
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
