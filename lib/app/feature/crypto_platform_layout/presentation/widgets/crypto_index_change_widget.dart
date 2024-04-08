import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/app/common/constants/app_sizes.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/theme/crypto_platform_color_theme.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/theme/crypto_platform_text_style.dart';

class CryptoIndexChangeWidget extends StatelessWidget {
  const CryptoIndexChangeWidget({super.key, required this.indexChange});

  final double indexChange;

  @override
  Widget build(BuildContext context) {
    final uiData = switch (indexChange) {
      < 0 => (
          icon: const RotatedBox(
            quarterTurns: 2,
            child: Icon(
              Icons.arrow_outward,
              size: Sizes.p16,
              color: CryptoPlatformColorTheme.onIndexColor,
            ),
          ),
          backgroundColor: CryptoPlatformColorTheme.negativeIndexColor,
          sign: '-'
        ),
      _ => (
          icon: const RotatedBox(
            quarterTurns: 0,
            child: Icon(
              Icons.arrow_outward,
              size: Sizes.p16,
              color: CryptoPlatformColorTheme.onIndexColor,
            ),
          ),
          backgroundColor: CryptoPlatformColorTheme.positiveIndexColor,
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
              style: CryptoPlatformTextStyle.britanicaSemiExpandedRegular.size14
                  .copyWith(color: CryptoPlatformColorTheme.onIndexColor),
            ),
            gapW4,
          ],
        ),
      ),
    );
  }
}
