import 'package:flutter/material.dart';
import 'package:website/animations.dart/waveBackground.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Myers Berry',
      theme: ThemeData(),
      home: const mainApp(),
    );
  }
}

class mainApp extends StatefulWidget {
  const mainApp({Key? key})
      : super(key: key);

  @override
  State<mainApp> createState() =>
      _mainAppState();
}

class _mainAppState
    extends State<mainApp> {
  @override
  Widget build(BuildContext context) {
    return FancyBackgroundApp();
  }
}
