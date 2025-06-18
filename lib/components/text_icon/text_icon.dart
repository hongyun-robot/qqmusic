/*
 * @author: hongyun
 * @since: 2025-05-29
 * z_icon.dart
*/
import 'package:flutter/material.dart';

class TextIcon extends StatefulWidget {
  const TextIcon({
    required this.icon,
    required this.color,
    this.message = '',
    this.onTap,
    this.hoverColor,
    this.size,
    this.disabled,
    this.padding,
    this.cursor = SystemMouseCursors.click,
    super.key,
  });

  final String message;
  final EdgeInsetsGeometry? padding;
  final String icon;
  final void Function()? onTap;
  final Color color;
  final Color? hoverColor;
  final double? size;
  final bool? disabled;
  final MouseCursor cursor;
  @override
  State<TextIcon> createState() => _ZIconState();
}

class _ZIconState extends State<TextIcon> with SingleTickerProviderStateMixin {
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (event) {
        _controller.forward();
      },
      onExit: (event) {
        _controller.reverse();
      },
      child: GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
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
              return Container(
                padding: widget.padding,
                decoration: BoxDecoration(
                  border: Border.all(color: _colorAnimation.value as Color),
                  borderRadius: BorderRadius.circular(3.5),
                ),
                child: Text(
                  widget.icon,
                  textHeightBehavior: const TextHeightBehavior(
                    applyHeightToLastDescent: false,
                    applyHeightToFirstAscent: false,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                  style: TextStyle(
                    color: _colorAnimation.value,
                    fontSize: widget.size,
                    height: 0.1,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
