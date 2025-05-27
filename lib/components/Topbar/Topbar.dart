import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qqmusic/components/ZIcon/ZIcon.dart';
import 'package:qqmusic/const/icon-style.dart';
import 'package:window_manager/window_manager.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    bool backIconDisabled = true;
    bool frontIconDisabled = true;
    return Container(
      height: 53,
      padding: EdgeInsets.fromLTRB(42, 10, 23, 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 246, 246, 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onPanStart: (details) {
          windowManager.startDragging();
        },
        child: Row(
          children: [
            ZIcon(
              icon: Icons.arrow_back_ios,
              color: ICON_STYLE.defaultColor,
              hoverColor: ICON_STYLE.hoverColor,
              disabled: backIconDisabled,
              message: '后退',
              size: 21,
              onTap: () {
                var r = GoRouter.of(context);
                if (r.canPop()) {
                  // todo: 实现回退功能
                  backIconDisabled = false;
                  r.pop();
                } else {
                  backIconDisabled = true;
                }
              },
            ),
            SizedBox(width: 10),
            ZIcon(
              icon: Icons.arrow_forward_ios,
              color: ICON_STYLE.defaultColor,
              hoverColor: ICON_STYLE.hoverColor,
              disabled: frontIconDisabled,
              message: '前进',
              size: 21,
              onTap: () {
                // windowManager.minimize();
              },
            ),
            SizedBox(width: 15),
            ZIcon(
              icon: Icons.autorenew_rounded,
              color: Color.fromRGBO(133, 133, 133, 1.0),
              hoverColor: ICON_STYLE.hoverColor,
              message: '刷新',
              size: 21,
            ),
            Spacer(),
            ZIcon(
              icon: Icons.horizontal_rule_rounded,
              color: ICON_STYLE.defaultColor,
              hoverColor: ICON_STYLE.hoverColor,
              message: '最小化',
              size: 20,
              onTap: () {
                windowManager.minimize();
              },
            ),
            SizedBox(width: 16),
            ZIcon(
              icon: Icons.crop_square_rounded,
              color: ICON_STYLE.defaultColor,
              hoverColor: ICON_STYLE.hoverColor,
              message: '最大化',
              size: 20,
              onTap: () async {
                if (await windowManager.isMaximized()) {
                  windowManager.unmaximize();
                } else {
                  windowManager.maximize();
                }
              },
            ),
            SizedBox(width: 15),
            ZIcon(
              icon: Icons.close_rounded,
              color: ICON_STYLE.defaultColor,
              hoverColor: ICON_STYLE.hoverColor,
              message: '关闭',
              size: 20,
              onTap: () {
                windowManager.close();
              },
            ),
          ],
        ),
      ),
    );
  }
}
