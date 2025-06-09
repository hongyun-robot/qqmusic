import 'package:flutter/material.dart';
import 'package:qqmusic/components/player/player.dart';
import 'package:qqmusic/components/sidebar/sidebar.dart';
import 'package:qqmusic/components/topbar/topbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.child, super.key});
  final Widget child;

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
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Topbar(),
                            Expanded(
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                                child: child,
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
