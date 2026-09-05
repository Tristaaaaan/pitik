import 'package:go_router/go_router.dart';

import '../../features/package/presentation/screen/package_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return PackageScreen();
      },
    ),
  ],
);
