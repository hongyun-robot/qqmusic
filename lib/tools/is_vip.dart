import 'package:qqmusic/model/songlist/collect_song.dart';

bool isVIP(Songlist data) {
  final List<int> f =
      data.action.icons
          .toRadixString(2)
          .split('')
          .map((v) => int.parse(v))
          .toList()
          .reversed
          .toList();

  try {
    return f[18] != 0;
  } catch (e) {
    return false;
  }
}
