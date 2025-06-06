/*
 * @author: hongyun
 * @since: 2025-06-06
 * ImageIcon.dart
*/
import 'package:flutter/material.dart';
import 'package:qqmusic/const/const.dart';

class ImageIcon extends StatefulWidget {
  const ImageIcon({
    super.key,
    required this.src,
    required this.text,
    this.onTap,
  });

  final String src;
  final String text;
  final void Function()? onTap;
  @override
  State<ImageIcon> createState() => _ImageIconState();
}

class _ImageIconState extends State<ImageIcon> {
  Color color = Colors.transparent;
  bool isCurrentPage = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        if (!isCurrentPage) {
          setState(() {
            color = PRIMARY_COLOR;
          });
        }
      },
      onExit: (event) {
        if (!isCurrentPage) {
          setState(() {
            color = Colors.transparent;
          });
        }
      },
      child: Tooltip(
        message: widget.text,
        padding: EdgeInsets.all(0),
        waitDuration: const Duration(seconds: 1),
        textStyle: TextStyle(color: Colors.black),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
        ),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: color,
            ),
            padding: EdgeInsets.fromLTRB(17, 17, 17, 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(widget.src, width: 28, height: 28),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.text,
                    style: TextStyle(fontSize: 14.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
