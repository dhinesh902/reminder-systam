import 'package:go_router/go_router.dart';
import 'package:reminder/routes/app_routes.dart';
import 'package:reminder/views/auth/login.dart';
import 'package:reminder/views/auth/onboard.dart';
import 'package:reminder/views/auth/splash.dart';
import 'package:reminder/views/main_dashboard/customers/add_customer_product.dart';
import 'package:reminder/views/main_dashboard/customers/add_customers.dart';
import 'package:reminder/views/main_dashboard/customers/customer_detail.dart';
import 'package:reminder/views/main_dashboard/followups/add_follwups.dart';
import 'package:reminder/views/main_dashboard/followups/followup_detail.dart';
import 'package:reminder/views/main_dashboard/main_dashboard.dart';
import 'package:reminder/views/main_dashboard/notifications/notifications.dart';
import 'package:reminder/views/main_dashboard/invoices/invoices.dart';
import 'package:reminder/views/main_dashboard/invoices/add_invoice.dart';
import 'package:reminder/views/main_dashboard/invoices/view_invoice.dart';
import 'package:reminder/views/main_dashboard/products/add_products.dart';
import 'package:reminder/views/main_dashboard/products/products.dart';
import 'package:reminder/views/main_dashboard/services/add_service_history.dart';
import 'package:reminder/views/main_dashboard/services/add_services.dart';
import 'package:reminder/views/main_dashboard/products/product_detail.dart';
import 'package:reminder/views/main_dashboard/services/service_detail.dart';

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
        path: AppRoutes.addCustomer,
        builder: (context, state) => const AddCustomers(),
      ),
      GoRoute(
        path: AppRoutes.addProduct,
        builder: (context, state) => const AddProducts(),
      ),
      GoRoute(
        path: AppRoutes.addFollowup,
        builder: (context, state) => const AddFollowup(),
      ),
      GoRoute(
        path: AppRoutes.addCustomerProduct,
        builder: (context, state) => const AddCustomerProduct(),
      ),
      GoRoute(
        path: AppRoutes.addServiceHistory,
        builder: (context, state) => const AddServiceHistory(),
      ),
      GoRoute(
        path: AppRoutes.addService,
        builder: (context, state) => const AddServices(),
      ),
      GoRoute(
        path: AppRoutes.viewInvoice,
        builder: (context, state) => const ViewInvoice(),
      ),
      GoRoute(
        path: AppRoutes.products,
        builder: (context, state) => const Products(),
      ),
      GoRoute(
        path: AppRoutes.productDetail,
        builder: (context, state) => const ProductDetail(),
      ),
      GoRoute(
        path: AppRoutes.serviceDetail,
        builder: (context, state) => const ServiceDetail(),
      ),
      GoRoute(
        path: AppRoutes.customerDetail,
        builder: (context, state) => const CustomerDetail(),
      ),
      GoRoute(
        path: AppRoutes.followupDetails,
        builder: (context, state) => const FollowupDetail(),
      ),
    ],
  );
}
