import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/app/common/constants/app_sizes.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/theme/crypto_platform_color_theme.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/theme/crypto_platform_text_style.dart';

class CryptoIndexChangeWidget extends StatelessWidget {
  const CryptoIndexChangeWidget(this.indexChange, {super.key});

  final double indexChange;

  @override
  Widget build(BuildContext context) {
    final uiData = switch (indexChange) {
      < 0 => (
          icon: const _ArrowIcon(_IndexChangeType.negative),
          backgroundColor:
              CryptoPlatformColorTheme.negativeIndexBackgroundColor,
          sign: '-'
        ),
      _ => (
          icon: const _ArrowIcon(_IndexChangeType.positive),
          backgroundColor:
              CryptoPlatformColorTheme.positiveIndexBackgroundColor,
          sign: '+'
        ),
    };

    return DecoratedBox(
      decoration: BoxDecoration(
        color: uiData.backgroundColor,
        borderRadius: BorderRadius.circular(Sizes.p8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            gapW4,
            uiData.icon,
            gapW4,
            Text(
              '${uiData.sign}${indexChange.abs().toStringAsFixed(1)}%',
              style: CryptoPlatformTextStyle.britanicaBold.size12
                  .copyWith(color: CryptoPlatformColorTheme.indexTextColor),
            ),
            gapW4,
          ],
        ),
      ),
    );
  }
}

class _ArrowIcon extends StatelessWidget {
  const _ArrowIcon(this.indexChangeType);

  final _IndexChangeType indexChangeType;

  @override
  Widget build(BuildContext context) {
    final quarterTurns = switch (indexChangeType) {
      _IndexChangeType.positive => 0,
      _IndexChangeType.negative => 2,
    };

    return RotatedBox(
      quarterTurns: quarterTurns,
      child: const Icon(
        Icons.arrow_outward,
        size: Sizes.p16,
        color: CryptoPlatformColorTheme.indexTextColor,
      ),
    );
  }
}

enum _IndexChangeType {
  positive,
  negative,
}
