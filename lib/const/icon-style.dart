import 'package:flutter/material.dart';
import 'package:qqmusic/const/const.dart';

abstract class IconStyleColorInterface {
  Color get defaultColor;
  Color get hoverColor;
}

class IconStyle implements IconStyleColorInterface {
  @override
  Color defaultColor;
  @override
  Color hoverColor;

  IconStyle({required this.defaultColor, required this.hoverColor});

  Object toMap() {
    return {
      'color': {'defaultColor': defaultColor, 'hoverColor': hoverColor},
    };
  }
}

final IconStyle ICON_STYLE = IconStyle(
  defaultColor: DEFAULT_COLOR,
  hoverColor: PRIMARY_COLOR,
);
