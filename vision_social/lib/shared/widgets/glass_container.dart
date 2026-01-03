import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double blur;
  final double opacity;
  final Color color;
  final Border? border;
  final VoidCallback? onTap;

  const GlassContainer({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 24.0,
    this.child,
    this.padding,
    this.margin,
    this.blur = 20.0,
    this.opacity = 0.1,
    this.color = Colors.white,
    this.border,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget container = Container(
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color: color.withValues(alpha: opacity),
              borderRadius: BorderRadius.circular(borderRadius),
              border: border ?? Border.all(
                color: Colors.white.withValues(alpha: 0.15),
                width: 1.0,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: container,
      );
    }
    return container;
  }
}
