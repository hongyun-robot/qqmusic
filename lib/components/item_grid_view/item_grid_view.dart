/*
 * @author: hongyun
 * @since: 2025-06-12
 * item_grid_view.dart
*/
import 'package:flutter/material.dart';
import 'package:qqmusic/components/z_icon/z_icon.dart' show ZIcon;
import 'package:qqmusic/components/z_text/z_text.dart' show ZText;
import 'package:qqmusic/const/icon-style.dart' show ICON_STYLE;

class ItemGridView<T> extends StatefulWidget {
  const ItemGridView({
    super.key,
    required this.data,
    required this.idKey,
    required this.imgKey,
    required this.titleKey,
    this.subTileKey,
    this.childAspectRatio = 0.7,
    this.imageAspectRatio = 1,
    this.minCrossAxisCount = 4,
  });
  final List<T> data;
  final String idKey;
  final String imgKey;
  final String titleKey;
  final String? subTileKey;
  final double childAspectRatio;
  final double imageAspectRatio;
  final int minCrossAxisCount;

  @override
  State<ItemGridView> createState() => _ItemGridViewState<T>();
}

class _ItemGridViewState<T> extends State<ItemGridView> {
  int? current;
  int? currentItem;
  final Color maskColor = Color.fromRGBO(0, 0, 0, 0.5);
  final Matrix4 translationValues = Matrix4.translationValues(0, -10, 0);

  @override
  Widget build(BuildContext context) {
    late int crossAxisCount;
    final double crossAxisSpacing = 20;
    final double childAspectRatio = widget.childAspectRatio;
    final double mainAxisSpacing = 0;
    final itemCount = widget.data.length;
    late final double imageHeight;
    late final int rowCount;

    final width = MediaQuery.of(context).size.width - 220 - 80 - 36;
    crossAxisCount = widget.minCrossAxisCount + (((width - 585) / 195).floor());
    crossAxisCount = crossAxisCount >= 7 ? 7 : crossAxisCount;

    rowCount = (itemCount / crossAxisCount).ceil();
    final itemWidth =
        (width - (crossAxisCount - 1) * crossAxisSpacing) / crossAxisCount;
    final itemHeight =
        childAspectRatio < 1
            ? itemWidth / childAspectRatio
            : itemWidth * childAspectRatio;

    imageHeight = itemWidth * widget.imageAspectRatio;
    final totalHeight =
        itemHeight * rowCount + mainAxisSpacing * (rowCount - 1);
    return SizedBox(
      height: totalHeight,
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        children:
            widget.data
                .map(
                  (i) => MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        currentItem = i.getField<int>(widget.idKey);
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        currentItem = null;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (event) {
                            setState(() {
                              current = i.getField<int>(widget.idKey);
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              current = null;
                            });
                          },
                          child: AnimatedContainer(
                            width: itemWidth,
                            height: imageHeight,
                            // transform: translationValues,
                            transform:
                                current == i.getField<int>(widget.idKey)
                                    ? translationValues
                                    : Matrix4.translationValues(0, 0, 0),
                            duration: Duration(milliseconds: 200),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Image.network(
                                  i.getField<String>(widget.imgKey),
                                  width: itemWidth,
                                  height: imageHeight,
                                  fit: BoxFit.fill,
                                ),
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 150),
                                  color:
                                      current == i.getField<int>(widget.idKey)
                                          ? maskColor
                                          : Colors.transparent,
                                  height: imageHeight,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ZText(
                                    text: i.getField<String>(widget.titleKey),
                                    hoverColor: ICON_STYLE.hoverColor,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 3),
                                  widget.subTileKey != null
                                      ? ZText(
                                        text: i.getField<String>(
                                          widget.subTileKey,
                                        ),
                                        color: Color.fromRGBO(
                                          123,
                                          123,
                                          123,
                                          1.0,
                                        ),
                                        hoverColor: ICON_STYLE.hoverColor,
                                        softWrap: true,
                                      )
                                      : SizedBox(),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child:
                                  currentItem == i.getField<int>(widget.idKey)
                                      ? MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: ZIcon(
                                          icon: Icons.delete_outline_rounded,
                                          color: ICON_STYLE.defaultColor,
                                          hoverColor: ICON_STYLE.hoverColor,
                                          size: 20,
                                        ),
                                      )
                                      : SizedBox(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
