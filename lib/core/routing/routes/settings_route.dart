import 'package:flutter_ui_challenges/app/feature/settings/presentation/settings_screen/settings_screen.dart';
import 'package:flutter_ui_challenges/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

final settingsRoute = GoRoute(
  path: AppRoute.settings.path,
  name: AppRoute.settings.name,
  builder: (context, state) => const SettingsScreen(),
);
