import 'package:go_router/go_router.dart';
import '../../presentation/dough/dough_root.dart';

/// 앱 전체의 라우팅을 관리하는 GoRouter 인스턴스입니다.
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const DoughRoot(),
    ),
  ],
);
