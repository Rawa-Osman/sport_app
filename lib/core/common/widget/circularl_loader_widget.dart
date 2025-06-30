import 'dart:io';
import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key, this.progress, this.color, this.width});
  final double? progress;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? CircularProgressIndicator.adaptive(value: progress)
          : CircularProgressIndicator(
              value: progress,
              color: color,
              strokeWidth: width ?? 4,
            ),
    );
  }
}
