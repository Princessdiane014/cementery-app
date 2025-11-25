import 'package:cementery_reservation/map_painter.dart';
import 'package:flutter/material.dart';

class CemeteryMapScreen extends StatefulWidget {
  const CemeteryMapScreen({super.key});

  @override
  State<CemeteryMapScreen> createState() => _CemeteryMapScreenState();
}

class _CemeteryMapScreenState extends State<CemeteryMapScreen> {
  String? selectedRegion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cemetery Map")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          return GestureDetector(
            onTapDown: (TapDownDetails details) {
              final offset = details.localPosition;

              final map = MapPainter();
              final regions = map.buildRegions(Size(width, height));

              for (var region in regions.entries) {
                if (region.value.contains(offset)) {
                  setState(() {
                    selectedRegion = region.key;
                  });

                  Navigator.pop(context, region.key);
                }
              }
            },
            child: CustomPaint(
              painter: MapPainter(selectedRegion: selectedRegion),
              size: Size(width, height),
            ),
          );
        },
      ),
    );
  }
}
