import 'package:flutter_ui_challenges/app/feature/challenges/presentation/examples_screen/challenges_screen.dart';
import 'package:flutter_ui_challenges/core/routing/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoute {
  home('/'),
  settings('settings'),
  cryptoPlatform('crypto_platform'),
  twitterEmbedCard('twitter_embed_card'),
  pushable3DButton('pushable_3d_button'),
  radialCountdownTimer('radial_countdown_timer'),
  interactivePageFlip('interactive_page_flip'),
  ;

  const AppRoute(this.path);

  final String path;
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
          twitterEmbedCardRoute,
          pushable3DButtonRoute,
          radialCountdownTimerRoute,
          interactivePageFlipRoute,
        ],
      ),
    ],
  );
}
