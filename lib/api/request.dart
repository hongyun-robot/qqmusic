abstract class Request {
  String get baseAddr;
  set baseAddr(String baseAddr) => baseAddr;

  String getUrl(String url) {
    return '$baseAddr$url';
  }
}
