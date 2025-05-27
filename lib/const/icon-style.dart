import 'package:flutter/material.dart';
import 'package:qqmusic/const/const.dart';

abstract class IconStyleColorInterface {
  Color get defaultColor;
  Color get hoverColor;
  Color get disableColor;
}

class IconStyle implements IconStyleColorInterface {
  @override
  Color defaultColor;
  @override
  Color hoverColor;
  @override
  Color disableColor;

  IconStyle({
    required this.defaultColor,
    required this.hoverColor,
    required this.disableColor,
  });

  Object toMap() {
    return {
      'color': {
        'defaultColor': defaultColor,
        'hoverColor': hoverColor,
        'disableColor': disableColor,
      },
    };
  }
}

final IconStyle ICON_STYLE = IconStyle(
  defaultColor: DEFAULT_ICON_COLOR,
  hoverColor: PRIMARY_ICON_COLOR,
  disableColor: DISABLE_ICON_COLOR,
);
