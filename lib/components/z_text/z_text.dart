/*
 * @author: hongyun
 * @since: 2025-06-12
 * z_text.dart
*/
import 'package:flutter/material.dart';

class ZText extends StatefulWidget {
  const ZText({
    required this.text,
    this.color = Colors.black,
    this.cursor = SystemMouseCursors.click,
    this.onTap,
    this.hoverColor,
    this.softWrap,
    this.size,
    this.disabled,
    this.overflow,
    super.key,
  });

  final String text;
  final void Function()? onTap;
  final MouseCursor cursor;
  final Color color;
  final Color? hoverColor;
  final bool? softWrap;
  final double? size;
  final bool? disabled;
  final TextOverflow? overflow;

  @override
  State<ZText> createState() => _ZTextState();
}

class _ZTextState extends State<ZText> with SingleTickerProviderStateMixin {
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
      end: widget.hoverColor ?? widget.color,
    ).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant ZText oldWidget) {
    super.didUpdateWidget(oldWidget);
    _colorAnimation = ColorTween(
      begin: widget.color,
      end: widget.hoverColor ?? widget.color,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (event) {
        if (widget.hoverColor != null) {
          _controller.forward();
        }
      },
      onExit: (event) {
        if (widget.hoverColor != null) {
          _controller.reverse();
        }
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return Text(
              widget.text,
              softWrap: widget.softWrap,
              overflow: widget.overflow,
              style: TextStyle(
                color: _colorAnimation.value,
                fontSize: widget.size,
              ),
            );
          },
        ),
      ),
    );
  }
}
