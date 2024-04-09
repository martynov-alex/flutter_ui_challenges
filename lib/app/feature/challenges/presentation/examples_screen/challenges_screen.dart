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
      body: ListView(
        shrinkWrap: true,
        children: [
          ExpansionTile(
            leading: const Icon(Icons.design_services_outlined),
            title: Text('Dribble'.hardcoded),
            subtitle: Text('UI challenges from Dribble'.hardcoded),
            children: [
              ListView.builder(
                shrinkWrap: true,
                restorationId: 'dribble_challenges_list_view',
                itemCount: dribbbleChallengeList.length,
                itemBuilder: (context, index) {
                  final routeTitle = dribbbleChallengeList[index].title;
                  final routeName = dribbbleChallengeList[index].route;

                  return ListTile(
                    title: Text(routeTitle),
                    leading: Icon(dribbbleChallengeList[index].icon),
                    onTap: () => context.goNamed(routeName),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.code_outlined),
            title: Text('Code with Andrea'.hardcoded),
            subtitle: Text('UI challenges from Code with Andrea'.hardcoded),
            children: [
              ListView.builder(
                shrinkWrap: true,
                restorationId: 'code_with_andrea_challenges_list_view',
                itemCount: codeWithAndreaChallengeList.length,
                itemBuilder: (context, index) {
                  final routeTitle = codeWithAndreaChallengeList[index].title;
                  final routeName = codeWithAndreaChallengeList[index].route;

                  return ListTile(
                    title: Text(routeTitle),
                    leading: Icon(codeWithAndreaChallengeList[index].icon),
                    onTap: () => context.goNamed(routeName),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
