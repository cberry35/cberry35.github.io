import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:website/screens.dart/homepage.dart';

class FancyBackgroundApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: AnimatedBackground()),
        onBottom(const AnimatedWave(
          height: 190,
          speed: 0.8,
        )),
        onBottom(const AnimatedWave(
          height: 140,
          speed: 0.8,
          offset: pi,
        )),
        onBottom(const AnimatedWave(
          height: 240,
          speed: 0.8,
          offset: pi / 2,
        )),
        const Positioned.fill(child: homePage()),
      ],
    );
  }

  Widget onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
}

class AnimatedWave extends StatelessWidget {
  final double height;
  final double speed;
  final double offset;

  const AnimatedWave(
      {required this.height,
      required this.speed,
      this.offset = 0.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: height,
        width: constraints.biggest.width,
        child: LoopAnimation<double>(
            duration: Duration(
                milliseconds: (5000 / speed).round()),
            tween: Tween(begin: 0.0, end: (2 * pi)),
            builder: (context, child, value) {
              return CustomPaint(
                foregroundPainter:
                    CurvePainter(value + offset),
              );
            }),
      );
    });
  }
}

class CurvePainter extends CustomPainter {
  final double value;

  CurvePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()
      ..color = Colors.black.withAlpha(60);
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(size.width * 0.5, controlPointY,
        size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

enum _BgProps { color1, color2 }

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_BgProps>()
      ..add(
          _BgProps.color1,
          ColorTween(
              begin: const Color.fromARGB(150, 196, 13, 0),
              end: (const Color.fromARGB(150, 196, 13, 0))))
      ..add(
          _BgProps.color2,
          ColorTween(
              begin: Colors.black, end: (Colors.black)));

    return MirrorAnimation<MultiTweenValues<_BgProps>>(
      tween: tween,
      duration: const Duration(seconds: 10),
      builder: (context, child, value) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                value.get(_BgProps.color1),
                value.get(_BgProps.color2)
              ])),
        );
      },
    );
  }
}
