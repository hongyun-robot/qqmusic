import 'package:flutter/material.dart';
import 'package:qqmusic/const/icon-style.dart';

class ZIcon extends StatefulWidget {
  const ZIcon({
    required this.icon,
    required this.color,
    this.message = '',
    this.onTap,
    this.hoverColor,
    this.size,
    this.disabled,
    super.key,
  });

  final String message;
  final IconData icon;
  final void Function()? onTap;
  final Color color;
  final Color? hoverColor;
  final double? size;
  final bool? disabled;

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
      cursor:
          widget.disabled == true
              ? SystemMouseCursors.basic
              : SystemMouseCursors.click,
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
        onTap: () {
          if (widget.disabled != true) {
            if (widget.onTap != null) {
              widget.onTap!();
            }
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
              return Icon(
                widget.icon,
                color:
                    widget.disabled == true
                        ? ICON_STYLE.disableColor
                        : _colorAnimation.value,
                size: widget.size,
              );
            },
          ),
        ),
      ),
    );
  }
}
