import 'package:flutter/material.dart';
import 'package:work/data/var.dart';

class OllusCirclePath extends CustomPainter {
  final int numberOfPlanets;

  OllusCirclePath({
    required this.numberOfPlanets,
  });

  final Paint myPaint = Paint()
    ..color = Colors.white
    ..strokeWidth = 1.5
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    for (int i = 0; i < numberOfPlanets; ++i) {
      double newRadius = remoteness[i];
      path.addOval(
        Rect.fromCircle(
          center: const Offset(0, 0),
          radius: newRadius + 27,
        ),
      );

    }

    canvas.drawPath(path, myPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
