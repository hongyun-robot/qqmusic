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
            padding: const EdgeInsets.all(18.0),
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
                                color: Color.fromRGBO(246, 246, 246, 1.0),
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
