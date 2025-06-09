/*
 * @author: hongyun
 * @since: 2025-05-29
 * login_dialog.dart
*/
import 'dart:async';
import 'dart:convert';
import 'dart:io' show File;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qqmusic/api/user/user.dart' show UserApi;
import 'package:qqmusic/bloc/user_bloc.dart';
import 'package:qqmusic/components/z_icon/z_icon.dart';
import 'package:qqmusic/const/const.dart'
    show DEFAULT_ICON_COLOR, PRIMARY_ICON_COLOR;
import 'package:qqmusic/model/cookie.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key});

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  Uint8List? imgBytes;
  String message = '';
  String path = '';

  @override
  void initState() {
    super.initState();
    final userApi = UserApi();
    userApi.getLoginQr().then((value) {
      setState(() {
        imgBytes = value;
      });

      Timer.periodic(const Duration(seconds: 2), (timer) async {
        var value = await userApi.checkLoginQr();
        if (value != null) {
          if (value.code == 100) {
            timer.cancel();
            File file = QCookie.getCookieFile();
            QCookie().fromJson(value.result!.toJson());
            UserApi().id = QCookie().uin;
            file.writeAsStringSync(jsonEncode(value.result));
            setState(() {
              message = value.message;
            });
            context.read<UserBloc>().add(UserLoadedEvent());
            // context.read
            return;
          }
          if (value.refresh != null && (value.refresh as bool) == true) {
            timer.cancel();
            return;
          }

          if (value.result == 502) {
            timer.cancel();
            return;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoginState) {
          if (state.isLogin) {
            context.pop();
          }
        }
      },
      listenWhen: (previous, current) => current is UserLoginState,
      child: Dialog(
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
                child:
                    imgBytes != null ? Image.memory(imgBytes!) : Placeholder(),
              ),
              SizedBox(height: 102),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message),
                  SizedBox(width: 40),
                  Text('密码登录'),
                  SizedBox(width: 40),
                  Text('注册账号'),
                  SizedBox(width: 40),
                  Text('意见反馈'),
                  Text(path),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
