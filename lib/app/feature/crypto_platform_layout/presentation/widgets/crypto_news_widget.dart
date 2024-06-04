import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/app/common/constants/app_sizes.dart';
import 'package:flutter_ui_challenges/app/common/ui/widgets/svg_icon.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/domain/crypto_news.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/theme/crypto_platform_color_theme.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/theme/crypto_platform_text_style.dart';

class CryptoNewsWidget extends StatelessWidget {
  const CryptoNewsWidget({
    required this.firstNews,
    required this.secondNews,
    this.height,
    this.width,
    super.key,
  });

  final CryptoNews firstNews;
  final CryptoNews secondNews;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: CryptoPlatformColorTheme.quinaryColor,
          borderRadius: BorderRadius.circular(Sizes.p24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              gapH16,
              _News(firstNews),
              gapH8,
              _News(secondNews),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'NEWS',
          style: CryptoPlatformTextStyle.britanicaBold.size12.copyWith(
            color: CryptoPlatformColorTheme.onQuinaryColor,
          ),
        ),
        Text(
          'See All',
          style: CryptoPlatformTextStyle.britanicaExpandedBold.size12.copyWith(
            color: CryptoPlatformColorTheme.onQuinaryColor,
          ),
        ),
      ],
    );
  }
}

class _News extends StatelessWidget {
  const _News(this.news);

  final CryptoNews news;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgIcon(asset: news.source.logoAsset, height: Sizes.p12),
                gapW8,
                Text(
                  news.source.name,
                  style: CryptoPlatformTextStyle.britanicaBold.size10.copyWith(
                    color: CryptoPlatformColorTheme.onQuinaryColor,
                  ),
                ),
              ],
            ),
            Text(
              news.title,
              maxLines: 3,
              softWrap: true,
              style: CryptoPlatformTextStyle.britanicaSemiExpandedBold.size14
                  .copyWith(
                color: CryptoPlatformColorTheme.onQuinaryColor,
              ),
            ),
            gapH8,
            Text(
              news.source.name,
              style: CryptoPlatformTextStyle.britanicaExpandedRegular.size12
                  .copyWith(
                color: CryptoPlatformColorTheme.onQuinaryColor,
              ),
            ),
          ],
        ),
        Image.asset(
          news.source.logoAsset,
          height: Sizes.p24,
          width: Sizes.p24,
        ),
      ],
    );
  }
}
