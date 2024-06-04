import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/core/assets/twitter_embed_card_vectors.dart';

/// SVG assets colors.
enum TwitterEmbedCardSvgAssets {
  comment(TwitterEmbedCardVectors.iconComment, Color(0xFF4999E9)),
  heartBlue(TwitterEmbedCardVectors.iconHeartBlue, Color(0xFF70ABE6)),
  heartRed(TwitterEmbedCardVectors.iconHeartRed, Color(0xFFE5387F)),
  info(TwitterEmbedCardVectors.iconInfo, Color(0xFF566370)),
  link(TwitterEmbedCardVectors.iconLink, Color(0xFF566370)),
  verified(TwitterEmbedCardVectors.iconVerified, Color(0xFF4999E9)),
  x(TwitterEmbedCardVectors.iconX, Color(0xFF101419));

  const TwitterEmbedCardSvgAssets(this.path, this.color);
  final String path;
  final Color color;
}
