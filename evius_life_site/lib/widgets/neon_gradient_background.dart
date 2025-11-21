import 'package:flutter/material.dart';

/// Neon gradient background widget with halo effect
class NeonGradientBackground extends StatelessWidget {
  const NeonGradientBackground({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomPaint(
      painter: _HaloPainter(theme),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLowest,
        ),
        child: child,
      ),
    );
  }
}

class _HaloPainter extends CustomPainter {
  const _HaloPainter(this.theme);

  final ThemeData theme;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 80);

    paint.color = theme.colorScheme.primary.withValues(alpha: 0.2);
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.3), 220, paint);

    paint.color = theme.colorScheme.secondary.withValues(alpha: 0.2);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.5), 260, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
