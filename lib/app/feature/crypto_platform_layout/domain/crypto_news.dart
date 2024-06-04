import 'package:flutter_ui_challenges/core/assets/news_source_logos.dart';

class CryptoNews {
  final String title;
  final NewsSource source;
  final String imageUrl;
  final DateTime publishedAt;
  final int commentsNumber;

  CryptoNews({
    required this.title,
    required this.source,
    required this.imageUrl,
    required this.publishedAt,
    required this.commentsNumber,
  });
}

enum NewsSource {
  cnbc('CNBC', NewsSourceLogos.cnbc),
  cnn('CNN International', NewsSourceLogos.cnn),
  ;

  const NewsSource(this.name, this.logoAsset);

  final String name;
  final String logoAsset;
}
