import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/core/localization/string_hardcoded.dart';

class TwitterEmbedCardScreen extends StatelessWidget {
  const TwitterEmbedCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Embed Card'.hardcoded),
      ),
      body: const Center(
        child: Text('Twitter Embed Card'),
      ),
    );
  }
}
