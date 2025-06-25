import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class HoverableRichText extends StatefulWidget {
  final List<TextSpan> textSpans;
  final TextStyle defaultStyle;
  final TextStyle? hoverStyle;
  final Duration transitionDuration;
  final Curve transitionCurve;
  final Gradient? defaultGradient;
  final Gradient? hoverGradient;

  const HoverableRichText({
    Key? key,
    required this.textSpans,
    required this.defaultStyle,
    this.hoverStyle,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.transitionCurve = Curves.easeInOut,
    this.defaultGradient,
    this.hoverGradient,
  }) : super(key: key);

  @override
  State<HoverableRichText> createState() => _HoverableRichTextState();
}

class _HoverableRichTextState extends State<HoverableRichText> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _hoveredIndex = null),
      onExit: (event) => setState(() => _hoveredIndex = null),
      child: RichText(
        text: TextSpan(
          children:
              widget.textSpans.asMap().entries.map((entry) {
                final int index = entry.key;
                final TextSpan span = entry.value;
                final bool isHovered = _hoveredIndex == index;

                // 确定使用的样式和渐变
                final TextStyle effectiveStyle =
                    isHovered
                        ? (widget.hoverStyle ??
                            widget.defaultStyle.copyWith(color: Colors.blue))
                        : widget.defaultStyle;

                final Gradient? effectiveGradient =
                    isHovered ? widget.hoverGradient : widget.defaultGradient;

                return TextSpan(
                  text: span.text,
                  // 使用 AnimatedDefaultTextStyle 包装子组件以实现渐变效果
                  children: [
                    WidgetSpan(
                      child: MouseRegion(
                        onEnter: (_) => setState(() => _hoveredIndex = index),
                        onExit: (_) => setState(() => _hoveredIndex = null),
                        child: AnimatedDefaultTextStyle(
                          style: effectiveStyle,
                          duration: widget.transitionDuration,
                          curve: widget.transitionCurve,
                          child:
                              effectiveGradient != null
                                  ? ShaderMask(
                                    shaderCallback:
                                        (bounds) =>
                                            effectiveGradient.createShader(
                                              Rect.fromLTWH(
                                                0,
                                                0,
                                                bounds.width,
                                                bounds.height,
                                              ),
                                            ),
                                    child: Text(
                                      span.text ?? '',
                                      style: effectiveStyle.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                  : Text(
                                    span.text ?? '',
                                    style: effectiveStyle,
                                  ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
