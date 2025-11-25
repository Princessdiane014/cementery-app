import 'package:flutter/material.dart';

class MapPainter extends CustomPainter {
  final String? selectedRegion;
  MapPainter({this.selectedRegion});

  @override
  void paint(Canvas canvas, Size size) {
    final border = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final selectedPaint = Paint()
      ..color = Colors.yellow.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    final regionPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.fill;

    // ===============================
    // DEFINE REGIONS BASED ON IMAGE
    // ===============================

    final regions = buildRegions(size);

    regions.forEach((key, path) {
      // Fill normally
      canvas.drawPath(path, regionPaint);

      // Highlight if selected
      if (key == selectedRegion) {
        canvas.drawPath(path, selectedPaint);
      }

      // Draw border
      canvas.drawPath(path, border);

      // Draw region label (A, B, C…)
      final textPainter = TextPainter(
        text: TextSpan(
          text: key,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      final bounds = path.getBounds();

      textPainter.paint(
        canvas,
        Offset(
          bounds.center.dx - textPainter.width / 2,
          bounds.center.dy - textPainter.height / 2,
        ),
      );
    });
  }

  // ================================================
  // RETURN MAP REGIONS (A–M) AS PATHS
  // YOU CAN EDIT SHAPES TO MATCH THE IMAGE 100%
  // ================================================
  Map<String, Path> buildRegions(Size size) {
    final w = size.width;
    final h = size.height;

    return {
      "A": Path()
        ..addRect(Rect.fromLTWH(w * .25, h * .30, w * .30, h * .18)),

      "B": Path()
        ..addRect(Rect.fromLTWH(w * .25, h * .50, w * .30, h * .18)),

      "C": Path()
        ..addRect(Rect.fromLTWH(w * .10, h * .70, w * .70, h * .20)),

      "D": Path()
        ..addRect(Rect.fromLTWH(w * .05, h * .60, w * .25, h * .35)),

      "E": Path()
        ..addRect(Rect.fromLTWH(w * .15, h * .50, w * .15, h * .15)),

      "F": Path()
        ..addRect(Rect.fromLTWH(w * .05, h * .38, w * .15, h * .25)),

      "G": Path()
        ..addRect(Rect.fromLTWH(w * .20, h * .25, w * .12, h * .12)),

      "H": Path()
        ..addRect(Rect.fromLTWH(w * .05, h * .20, w * .15, h * .20)),

      "I": Path()
        ..addRect(Rect.fromLTWH(w * .20, h * .10, w * .30, h * .18)),

      "J": Path()
        ..addRect(Rect.fromLTWH(w * .10, h * .05, w * .50, h * .15)),

      "K": Path()
        ..addRect(Rect.fromLTWH(w * .50, h * .20, w * .30, h * .25)),

      "L": Path()
        ..addRect(Rect.fromLTWH(w * .70, h * .05, w * .20, h * .25)),

      "M": Path()
        ..addRect(Rect.fromLTWH(w * .65, h * .32, w * .30, h * .45)),
    };
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
