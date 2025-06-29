import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_app/core/routes/routes.dart';
import 'package:sport_app/features/home/pages/home_page.dart';

@lazySingleton
class GoRouterConfig {
  late GoRouter router;
  // for this task we don't need a root key, or a custom transition or any other key

  void init() {
    router = GoRouter(
      // initialLocation: AppRoutes.home,
      initialLocation: AppRoutes.home,
      //* Logging
      debugLogDiagnostics: true,

      routes: [
        // Redirects -> if the path is empty, redirect to home
        GoRoute(
          path: '/',
          redirect: (_, __) => AppRoutes.home,
        ),
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => const HomePage(),
        ),
      ],
    );
  }
}
