import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.borderColor,
    this.backgroundColor,
  });

  final Widget child;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(top: 8.0),
      color: backgroundColor ?? Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color:
              borderColor ??
              Theme.of(context).colorScheme.surfaceTint.withValues(alpha: 0.1),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: child,
    );
  }
}
