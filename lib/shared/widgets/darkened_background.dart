import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class DarkenedBackground extends StatelessWidget {
  const DarkenedBackground({
    super.key,
    this.imagePath,
    this.startColor,
    this.endColor,
  });

  final String? imagePath;
  final Color? startColor;
  final Color? endColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath ?? Images.coverPhoto,
          fit: BoxFit.fitHeight,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.centerLeft,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                startColor ?? Colors.black.withValues(alpha: 0.8),
                endColor ?? Colors.black.withValues(alpha: 0.8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
