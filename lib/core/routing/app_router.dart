import 'package:flutter_ui_challenges/app/feature/challenges/presentation/examples_screen/challenges_screen.dart';
import 'package:flutter_ui_challenges/core/routing/not_found_screen.dart';
import 'package:flutter_ui_challenges/core/routing/routes/crypto_platform_route.dart';
import 'package:flutter_ui_challenges/core/routing/routes/settings_route.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoute {
  home('/', 'List of UI Challenges'),
  settings('settings', 'Settings'),
  cryptoPlatform('crypto_platform', 'Crypto Platform Layout'),
  ;

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
        builder: (context, state) => const ChallengesScreen(),
        routes: [
          settingsRoute,
          cryptoPlatformRoute,
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
