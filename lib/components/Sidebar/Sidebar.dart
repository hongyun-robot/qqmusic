import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qqmusic/components/Sidebar/components/TextIcon.dart';
import 'package:qqmusic/const/const.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({required this.constraints, super.key});

  final BoxConstraints constraints;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              TextIcon(
                icon: Icons.home_rounded,
                routerItem: ROUTER_NAME.recommend,
                onTap: () {
                  print(GoRouterState.of(context).name);
                  context.goNamed(ROUTER_NAME.recommend.name);
                },
              ),
              TextIcon(
                icon: Icons.explore_rounded,
                routerItem: ROUTER_NAME.musichall,
                onTap: () {
                  print(GoRouterState.of(context).name);
                  context.goNamed(ROUTER_NAME.musichall.name);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
