import 'package:flutter_ui_challenges/app/feature/pushable_3d_button/pushable_3d_button_screen.dart';
import 'package:flutter_ui_challenges/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

final pushable3DButtonRoute = GoRoute(
  path: AppRoute.pushable3DButton.path,
  name: AppRoute.pushable3DButton.name,
  builder: (_, __) => const Pushable3DButtonScreen(),
);
