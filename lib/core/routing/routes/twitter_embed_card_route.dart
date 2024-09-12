import 'package:flutter_ui_challenges/app/feature/twitter_embed_card/twitter_embed_card_screen.dart';
import 'package:flutter_ui_challenges/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

final twitterEmbedCardRoute = GoRoute(
  path: AppRoute.twitterEmbedCard.path,
  name: AppRoute.twitterEmbedCard.name,
  builder: (_, __) => const TwitterEmbedCardScreen(),
);
