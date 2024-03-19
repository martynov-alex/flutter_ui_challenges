import 'package:flutter_ui_challenges/app/feature/examples/presentation/examples_screen/examples_screen.dart';
import 'package:flutter_ui_challenges/core/routing/not_found_screen.dart';
import 'package:flutter_ui_challenges/core/routing/routes/settings_route.dart';
import 'package:flutter_ui_challenges/core/routing/routes/streams_example_route.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoute {
  customPainter('custom_painter', 'Custom Painter Example'),
  streams('streams', 'Streams Example'),
  home('/', 'List of examples'),
  settings('settings', 'Settings');

  const AppRoute(this.path, this.title);

  final String path;
  final String title;
}

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: AppRoute.home.path,
    routes: [
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        builder: (context, state) => const ExamplesScreen(),
        routes: [
          settingsRoute,
          streamsExampleRoute,
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
