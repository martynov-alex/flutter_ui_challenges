import 'package:flutter_ui_challenges/app/feature/streams_example/presentation/streams_example.dart';
import 'package:flutter_ui_challenges/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

final streamsExampleRoute = GoRoute(
  path: AppRoute.streams.path,
  name: AppRoute.streams.name,
  builder: (context, state) => const StreamsExampleScreen(),
);
