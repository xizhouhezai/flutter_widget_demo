import 'package:flutter/material.dart';

import 'package:flutter_widget_demo/components/wave/painter_base.dart';
import 'package:flutter_widget_demo/components/wave/painter_wave.dart';

abstract class BasePainterFactory {
  BasePainter getPainter();
}

class WavePainterFactory extends BasePainterFactory {
  BasePainter getPainter() {
    return WavePainter(
      waveCount: 1,
      waveColors: [
        Colors.lightBlueAccent[200],
      ],
      showProgressText: false,
      textStyle: TextStyle(
        fontSize: 60.0,
        foreground: Paint()
          ..color = Colors.lightBlue
          ..style = PaintingStyle.fill
          ..strokeWidth = 2.0
          ..blendMode = BlendMode.difference
          ..colorFilter = ColorFilter.mode(Colors.white, BlendMode.exclusion)
          ..maskFilter = MaskFilter.blur(BlurStyle.solid, 1.0),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
