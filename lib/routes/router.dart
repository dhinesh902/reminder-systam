import 'package:go_router/go_router.dart';
import 'package:reminder/routes/app_routes.dart';
import 'package:reminder/views/auth/login.dart';
import 'package:reminder/views/auth/onboard.dart';
import 'package:reminder/views/auth/splash.dart';
import 'package:reminder/views/main_dashboard/main_dashboard.dart';
import 'package:reminder/views/main_dashboard/notifications/notifications.dart';
import 'package:reminder/views/main_dashboard/invoices/invoices.dart';
import 'package:reminder/views/main_dashboard/invoices/add_invoice.dart';
import 'package:reminder/views/main_dashboard/invoices/view_invoice.dart';
import 'package:reminder/views/main_dashboard/products/products.dart';

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
      GoRoute(
        path: AppRoutes.mainDashboard,
        builder: (context, state) => const MainDashboard(),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) => const Notifications(),
      ),
      GoRoute(
        path: AppRoutes.invoices,
        builder: (context, state) => const Invoices(),
      ),
      GoRoute(
        path: AppRoutes.addInvoice,
        builder: (context, state) => const AddInvoice(),
      ),
      GoRoute(
        path: AppRoutes.viewInvoice,
        builder: (context, state) => const ViewInvoice(),
      ),
      GoRoute(
        path: AppRoutes.products,
        builder: (context, state) => const Products(),
      ),
    ],
  );
}