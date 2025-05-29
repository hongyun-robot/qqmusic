/*
 * @author: hongyun
 * @since: 2025-05-29
 * profile.dart
*/
import 'package:flutter/material.dart';
import 'package:qqmusic/components/sidebar/components/login_dialog.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) => LoginDialog(),
        );
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 53,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/demo/profile.png',
                  width: 22,
                  height: 22,
                ),
                SizedBox(width: 8),
                Text('点击登录', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
