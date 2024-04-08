import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_challenges/app/common/constants/app_sizes.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/domain/crypto_coin.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/data/crypto_coin_ui_x.dart';
import 'package:flutter_ui_challenges/core/assets/app_text_styles.dart';
import 'package:flutter_ui_challenges/core/utils/color_utils.dart';

class CryptoCoinWidget extends StatelessWidget {
  const CryptoCoinWidget({
    required this.coin,
    required this.indexChangePerDay,
    required this.price,
    this.height,
    this.width,
    super.key,
  });

  final CryptoCoin coin;
  final Decimal price;
  final double indexChangePerDay;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = coin.backgroundColor;
    final textColor = coin.textColor;

    return SizedBox(
      height: height,
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(Sizes.p24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _Header(coin),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(this.coin);

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.square(
          dimension: Sizes.p40,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: ColorUtils.lighterColor(coin.backgroundColor, 0.15),
              borderRadius: BorderRadius.circular(Sizes.p12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(Sizes.p8),
              child: SvgPicture.asset(
                coin.icon,
                colorFilter: ColorFilter.mode(coin.textColor, BlendMode.srcIn),
              ),
            ),
          ),
        ),
        gapW8,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                coin.name,
                style: AppTextStyles.britanicaBold.size14
                    .copyWith(color: coin.textColor),
                overflow: TextOverflow.fade,
                softWrap: false,
                maxLines: 1,
              ),
              gapW4,
              Text(
                coin.ticker,
                style: AppTextStyles.britanicaRegular.size12
                    .copyWith(color: coin.textColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
