import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/app/feature/twitter_embed_card/twitter_embed_card_svg_assets.dart';
import 'package:flutter_ui_challenges/core/localization/string_hardcoded.dart';
import 'package:flutter_ui_challenges/core/utils/vector_icon.dart';

class TwitterEmbedCardScreen extends StatelessWidget {
  const TwitterEmbedCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Embed Card'.hardcoded),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        // Use Center as layout has unconstrained width (loose constraints),
        // together with SizedBox to specify the max width (tight constraints)
        // See this thread for more info:
        // https://twitter.com/biz84/status/1445400059894542337
        child: Center(
          child: SizedBox(
            width: 600, // max allowed width
            child: TwitterEmbedCard(),
          ),
        ),
      ),
    );
  }
}

class TwitterEmbedCard extends StatelessWidget {
  const TwitterEmbedCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Delete this and implement the desired layout
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Use the icons below to build the completed layout',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: TwitterEmbedCardSvgAssets.values
              .map(
                (asset) => VectorIcon(
                  asset: asset.path,
                  color: asset.color,
                  height: 50,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
