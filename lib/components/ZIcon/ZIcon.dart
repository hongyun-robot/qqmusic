import 'package:flutter/material.dart';

class ZIcon extends StatefulWidget {
  const ZIcon({
    required this.icon,
    required this.color,
    this.message = '',
    this.onTap,
    this.hoverColor,
    this.size,
    super.key,
  });

  final String message;
  final IconData icon;
  final void Function()? onTap;
  final Color color;
  final Color? hoverColor;
  final double? size;

  @override
  State<ZIcon> createState() => _ZIconState();
}

class _ZIconState extends State<ZIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );

    _colorAnimation = ColorTween(
      begin: widget.color,
      end: widget.hoverColor as Color,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        if (widget.hoverColor != null) {
          _controller.forward();
        }
      },
      onExit: (event) {
        _controller.reverse();
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Tooltip(
          message: widget.message,
          padding: EdgeInsets.all(0),
          waitDuration: const Duration(seconds: 1),
          textStyle: TextStyle(color: Colors.black),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
          ),
          child: AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) {
              return Icon(
                widget.icon,
                color: _colorAnimation.value,
                size: widget.size,
              );
            },
          ),
        ),
      ),
    );
  }
}
