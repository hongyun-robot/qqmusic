/*
 * @author: hongyun
 * @since: 2025-06-10
 * my_diss.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qqmusic/bloc/user_bloc.dart';
import 'package:qqmusic/components/item_grid_view/item_grid_view.dart';
import 'package:qqmusic/model/m_detail.dart';

class MyDiss extends StatefulWidget {
  const MyDiss({super.key});

  @override
  State<MyDiss> createState() => _MyDissState();
}

class _MyDissState extends State<MyDiss> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          var mydiss = state.userInfo.data!.mydiss.mlist;
          return ItemGridView<Mlist>(
            data: mydiss,
            idKey: 'dissid',
            imgKey: 'picurl',
            titleKey: 'title',
          );
        }
        if (state is UserLoginState) {
          return Text(state.isLogin.toString());
        }
        return Text('123');
      },
      buildWhen: (previous, current) => current is UserLoaded,
    );
  }
}
