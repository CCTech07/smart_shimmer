library smart_shimmer;

import 'package:flutter/material.dart';

class SmartShimmer extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Color baseColor;
  final Color highlightColor;
  final Duration duration;

  const SmartShimmer({
    super.key,
    required this.isLoading,
    required this.child,
    this.baseColor = Colors.grey,
    this.highlightColor = Colors.white,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The actual UI layout (visible when not loading)
        Opacity(
          opacity: isLoading ? 0.3 : 1.0,
          // Dim the layout slightly during loading
          child: child,
        ),
        // Shimmer effect on top when loading
        if (isLoading)
          _ShimmerOverlay(
            baseColor: baseColor,
            highlightColor: highlightColor,
            duration: duration,
            child: child,
          ),
      ],
    );
  }
}

class _ShimmerOverlay extends StatefulWidget {
  final Color baseColor;
  final Color highlightColor;
  final Duration duration;
  final Widget child;

  const _ShimmerOverlay({
    required this.baseColor,
    required this.highlightColor,
    required this.duration,
    required this.child,
  });

  @override
  _ShimmerOverlayState createState() => _ShimmerOverlayState();
}

class _ShimmerOverlayState extends State<_ShimmerOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop, // Apply shimmer over the child's shape
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            widget.baseColor.withOpacity(0.5),
            widget.highlightColor.withOpacity(0.8),
            widget.baseColor.withOpacity(0.5),
          ],
          stops: [
            _controller.value - 0.3,
            _controller.value,
            _controller.value + 0.3,
          ],
        ).createShader(rect);
      },
      child: widget.child,
    );
  }
}
