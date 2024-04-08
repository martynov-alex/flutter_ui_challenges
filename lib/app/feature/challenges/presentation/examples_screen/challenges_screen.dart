import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/app/common/constants/challenge_list.dart';
import 'package:flutter_ui_challenges/core/localization/string_hardcoded.dart';
import 'package:flutter_ui_challenges/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

/// Список испытаний.
class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI challenges'.hardcoded),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.goNamed(AppRoute.settings.name),
          ),
        ],
      ),
      body: ListView.builder(
        restorationId: 'challenge_list_view',
        itemCount: challengeList.length,
        itemBuilder: (context, index) {
          final routeTitle = challengeList[index].title;
          final routeName = challengeList[index].route;

          return ListTile(
            title: Text(routeTitle),
            leading: Icon(challengeList[index].icon),
            onTap: () => context.goNamed(routeName),
          );
        },
      ),
    );
  }
}
