import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/app/feature/challenges/domain/challenge_info.dart';
import 'package:flutter_ui_challenges/core/localization/string_hardcoded.dart';
import 'package:flutter_ui_challenges/core/routing/app_router.dart';

final dribbbleChallengeList = <ChallengeInfo>[
  ChallengeInfo(
    title: 'Crypto Platform'.hardcoded,
    icon: Icons.monetization_on_outlined,
    route: AppRoute.cryptoPlatform.name,
  ),
];

final codeWithAndreaChallengeList = <ChallengeInfo>[
  ChallengeInfo(
    title: 'Twitter Embed Card'.hardcoded,
    icon: Icons.comment,
    route: AppRoute.twitterEmbedCard.name,
  ),
];
