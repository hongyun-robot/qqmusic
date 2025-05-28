/*
 * @author: hongyun
 * @since: 2025-05-23
 * TextIcon.dart
*/
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qqmusic/const/const.dart';

class TextIcon extends StatefulWidget {
  const TextIcon({
    super.key,
    required this.icon,
    required this.routerItem,
    this.onTap,
  });
  final IconData icon;
  final ROUTER_NAME routerItem;
  final void Function()? onTap;

  @override
  State<TextIcon> createState() => _TextIconState();
}

class _TextIconState extends State<TextIcon> {
  late Widget showWidget = Icon(widget.icon);
  Color color = Color.fromRGBO(233, 233, 233, 1.0);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    GoRouterState routerState = GoRouterState.of(context);
    String fullPath = routerState.fullPath as String;
    String key = '/${widget.routerItem.name}';
    if (key == fullPath) {
      color = Color.fromRGBO(216, 216, 216, 1.0);
    } else {
      color = Color.fromRGBO(233, 233, 233, 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            showWidget = Text(widget.routerItem.explain);
          });
        },
        onExit: (event) {
          setState(() {
            showWidget = Icon(widget.icon);
          });
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            height: 52,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(child: showWidget),
          ),
        ),
      ),
    );
  }
}
