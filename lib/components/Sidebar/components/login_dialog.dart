/*
 * @author: hongyun
 * @since: 2025-05-29
 * login_dialog.dart
*/
import 'package:flutter/material.dart';
import 'package:qqmusic/components/z_icon/z_icon.dart';
import 'package:qqmusic/const/const.dart'
    show DEFAULT_ICON_COLOR, PRIMARY_ICON_COLOR;

class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.fromLTRB(22, 15, 22, 0),
        width: 540,
        height: 475,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ZIcon(
                icon: Icons.close_rounded,
                color: DEFAULT_ICON_COLOR,
                hoverColor: PRIMARY_ICON_COLOR,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(height: 37),
            Center(
              child: Container(
                height: 38,
                width: 115,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: DEFAULT_ICON_COLOR),
                ),
                child: Center(child: Text('QQ登录')),
              ),
            ),
            SizedBox(height: 36),
            Text('快捷登录', style: TextStyle(fontSize: 20)),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('使用'),
                Text(
                  'QQ手机版',
                  style: TextStyle(color: Color.fromRGBO(46, 119, 229, 1.0)),
                ),
                Text('扫码登录'),
              ],
            ),
            SizedBox(height: 24),
            Container(
              width: 87,
              height: 87,
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(color: DEFAULT_ICON_COLOR),
              ),
              child: Placeholder(),
            ),
            SizedBox(height: 102),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('密码登录'),
                SizedBox(width: 40),
                Text('注册账号'),
                SizedBox(width: 40),
                Text('意见反馈'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
