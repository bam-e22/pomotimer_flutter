import 'package:flutter/material.dart';
import 'package:pomotimer/constants/colors.dart';
import 'package:pomotimer/ui/timer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: MyColors.carminePink,
        scaffoldBackgroundColor: MyColors.carminePink,
        appBarTheme: const AppBarTheme(
          color: MyColors.carminePink,
          surfaceTintColor: MyColors.carminePink
        ),
      ),
      home: const TimerScreen(),
    );
  }
}
