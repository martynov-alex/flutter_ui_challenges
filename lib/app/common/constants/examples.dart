import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/app/feature/examples/domain/example_info.dart';
import 'package:flutter_ui_challenges/core/localization/string_hardcoded.dart';
import 'package:flutter_ui_challenges/core/routing/app_router.dart';

final examples = [
  ExampleInfo(
    title: 'Streams'.hardcoded,
    icon: Icons.replay_circle_filled_outlined,
    route: AppRoute.streams.name,
  ),
];
