/*
 * @author: hongyun
 * @since: 2025-05-27
 * TextIcon2.dart
*/
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qqmusic/const/const.dart';

class TextIcon2 extends StatefulWidget {
  const TextIcon2({
    super.key,
    required this.icon,
    required this.routerItem,
    this.activeIcon,
    this.onTap,
  });
  final IconData icon;
  final IconData? activeIcon;
  final ROUTER_NAME routerItem;
  final void Function()? onTap;
  @override
  State<TextIcon2> createState() => _TextIcon2State();
}

class _TextIcon2State extends State<TextIcon2> {
  Color color = Color.fromRGBO(233, 233, 233, 1.0);
  bool isCurrentPage = false;
  late IconData iconData = widget.icon;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    GoRouterState routerState = GoRouterState.of(context);
    String fullPath = routerState.fullPath as String;
    String key = '/${widget.routerItem.name}';
    isCurrentPage = key == fullPath;

    if (isCurrentPage) {
      color = Color.fromRGBO(216, 216, 216, 1.0);
      if (widget.activeIcon != null) {
        iconData = widget.activeIcon as IconData;
      }
    } else {
      color = Colors.transparent;
      if (widget.activeIcon != null) {
        iconData = widget.icon;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        if (!isCurrentPage) {
          setState(() {
            color = PRIMARY_COLOR;
          });
        }
      },
      onExit: (event) {
        if (!isCurrentPage) {
          setState(() {
            color = Colors.transparent;
          });
        }
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: color,
          ),
          padding: EdgeInsets.fromLTRB(17, 18, 17, 16),
          child: Row(
            children: [
              Icon(iconData, weight: 19),
              SizedBox(width: 10),
              Text(widget.routerItem.explain),
            ],
          ),
        ),
      ),
    );
  }
}
