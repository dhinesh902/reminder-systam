import 'package:go_router/go_router.dart';
import 'package:reminder/routes/app_routes.dart';
import 'package:reminder/views/auth/login.dart';
import 'package:reminder/views/auth/onboard.dart';
import 'package:reminder/views/auth/splash.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const Splash(),
      ),
      GoRoute(
        path: AppRoutes.onboard,
        builder: (context, state) => const Onboard(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const Login(),
      ),
    ],
  );
}