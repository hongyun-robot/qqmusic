import 'package:flutter/material.dart';
import 'package:qqmusic/components/Sidebar/Sidebar.dart';
import 'package:qqmusic/components/Topbar/Topbar.dart';

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
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                SafeArea(child: Sidebar(constraints: constraints)),
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
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(246, 246, 246, 1.0),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: BottomAppBar(
                                height: 77,
                                color: Colors.transparent,
                              ),
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
