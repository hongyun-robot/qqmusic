import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:provider/provider.dart';
import 'package:qqmusic/bloc/scroll_bloc.dart';
import 'package:qqmusic/components/player/player.dart';
import 'package:qqmusic/components/sidebar/sidebar.dart';
import 'package:qqmusic/components/topbar/topbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.child, super.key});
  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  late final ScrollBloc _scrollBloc;

  @override
  void initState() {
    _scrollBloc = context.read<ScrollBloc>();
    _scrollBloc.add(ScrollLoadedEvent(_controller));
    // TODO: implement initState
    // _controller.addListener(() {
    //   print(_controller.offset);
    // });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext build) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
              bottom: 18,
              top: 10,
            ),
            child: Row(
              children: [
                SafeArea(child: Sidebar()),
                Flexible(
                  child: Column(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Topbar(),
                            Expanded(
                              child: SingleChildScrollView(
                                controller: _controller,
                                child: Container(
                                  constraints: constraints.copyWith(
                                    minHeight: 0,
                                    maxHeight: double.infinity,
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  padding: const EdgeInsets.only(
                                    left: 40,
                                    right: 40,
                                    top: 23,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(246, 246, 246, 1.0),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                  ),
                                  child: IntrinsicHeight(child: widget.child),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Container(
                              height: 77,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(246, 246, 246, 1.0),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Player(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
