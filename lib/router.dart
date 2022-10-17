import 'package:asset_tracker/apis/apis.dart';
import 'package:asset_tracker/pages/pages.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'users/add',
          builder: (context, state) => const UserAddPage(),
        ),
        GoRoute(
          path: 'users/:id',
          builder: (context, state) {
            // Example of how to lookup path parameters.
            final userId = state.params['id']!;
            return UserEditPage(user: state.extra as User);
          },
        ),
      ],
    ),

    // If you want to add more root level routes, do so as below.

    // GoRoute(
    //   path: '/login',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return LoginPage();
    //   },
    // ),
  ],
);
