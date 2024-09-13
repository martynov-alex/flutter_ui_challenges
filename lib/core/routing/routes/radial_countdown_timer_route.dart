import 'package:flutter_ui_challenges/app/feature/radial_countdown_timer/radial_countdown_timer_screen.dart';
import 'package:flutter_ui_challenges/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

final radialCountdownTimerRoute = GoRoute(
  path: AppRoute.radialCountdownTimer.path,
  name: AppRoute.radialCountdownTimer.name,
  builder: (_, __) => const RadialCountdownTimerScreen(),
);
