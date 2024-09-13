import 'package:flutter_ui_challenges/app/feature/interactive_page_flip/interactive_page_flip_screen.dart';
import 'package:flutter_ui_challenges/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

final interactivePageFlipRoute = GoRoute(
  path: AppRoute.interactivePageFlip.path,
  name: AppRoute.interactivePageFlip.name,
  builder: (_, __) => const InteractivePageFlipScreen(),
);
