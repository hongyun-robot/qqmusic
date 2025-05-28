import 'package:go_router/go_router.dart';

class RouteHistoryObserver {
  final List<GoRouterState> history = [];
  int currentIndex = 0;

  int indexAdd() {
    currentIndex++;
    return currentIndex;
  }

  int indexSub() {
    currentIndex--;
    return currentIndex;
  }

  void didPush(GoRouterState state) {
    print('push');
    history.add(state);
    indexAdd();
  }

  int didPop(GoRouterState state) {
    print('Pop');
    return indexSub();
  }

  void didRemove(GoRouterState state) {
    history.remove(state);
  }

  // 获取路由路径历史
  List<String> get pathHistory =>
      history.map((route) => route.fullPath ?? '').toList();

  // 获取当前路由下标
  int get currentRouterIndex => currentIndex;
}

final routeHistoryObserver = RouteHistoryObserver();
