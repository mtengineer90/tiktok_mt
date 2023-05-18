import 'package:go_router/go_router.dart';
import '../presentation/home_screen/view/home_screeen_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomeScreenPage(),
      ),
    ],
  );

  static const String initialRoute = '/';
}
