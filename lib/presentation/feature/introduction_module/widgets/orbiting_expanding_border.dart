import 'dart:math' as math;

import 'package:flutter/material.dart';

class OrbitingExpandingBorder extends StatefulWidget {
  final Widget? child;
  final double radius;
  final Color color;
  final Duration speed;
  final double lineWidth;

  const OrbitingExpandingBorder({
    super.key,
    required this.radius,
    required this.child,
    this.color = Colors.blueAccent,
    this.speed = const Duration(seconds: 10),
    this.lineWidth = 5,
  });

  @override
  State<OrbitingExpandingBorder> createState() =>
      _OrbitingExpandingBorderState();
}

class _OrbitingExpandingBorderState extends State<OrbitingExpandingBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.speed)
      ..repeat();
  }

  @override
  void didUpdateWidget(covariant OrbitingExpandingBorder oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the speed changes from the outside, update the controller
    if (widget.speed != oldWidget.speed) {
      _controller.duration = widget.speed;
      // We check if it was playing to resume it with the new duration
      if (_controller.isAnimating) {
        _controller.repeat();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _OrbitPainter(
            progress: _controller.value,
            color: widget.color,
            lineWidth: widget.lineWidth,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: widget.child,
          ),
        );
      },
    );
  }
}

class _OrbitPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double lineWidth;

  _OrbitPainter({
    required this.progress,
    required this.color,
    required this.lineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double radius = size.width / 2;
    final Rect rect = Rect.fromCircle(
      center: Offset(radius, radius),
      radius: radius,
    );

    double startAngle;
    double sweepAngle;

    // Phase 1: Growth, Phase 2: Shrink
    if (progress < 0.5) {
      double t = progress * 2;
      startAngle = -math.pi / 2;
      sweepAngle = t * (2 * math.pi);
    } else {
      double t = (progress - 0.5) * 2;
      sweepAngle = (1 - t) * (2 * math.pi);
      startAngle = (-math.pi / 2) + (t * 2 * math.pi);
    }

    // Global rotation to keep the "growth point" moving
    double offsetRotation = progress * 2 * math.pi;

    canvas.drawArc(
      rect,
      startAngle + offsetRotation,
      math.max(sweepAngle, 0.05), // Keep a tiny dot visible
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_OrbitPainter oldDelegate) => true;
}
