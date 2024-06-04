import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/domain/crypto_coin.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/theme/crypto_platform_color_theme.dart';
import 'package:flutter_ui_challenges/core/assets/crypto_platform_layout_assets.dart';

extension CryptoCoinUIX on CryptoCoin {
  String get icon => switch (this) {
        CryptoCoin.binanceCoin => CryptoPlatformLayoutAssets.bnb,
        CryptoCoin.bitcoin => CryptoPlatformLayoutAssets.btc,
        CryptoCoin.dash => CryptoPlatformLayoutAssets.dash,
        CryptoCoin.dogecoin => CryptoPlatformLayoutAssets.doge,
        CryptoCoin.ethereum => CryptoPlatformLayoutAssets.eth,
        CryptoCoin.ripple => CryptoPlatformLayoutAssets.xrp,
      };

  Color get backgroundColor => switch (this) {
        CryptoCoin.binanceCoin => CryptoPlatformColorTheme.tertiaryColor,
        CryptoCoin.bitcoin => CryptoPlatformColorTheme.primaryColor,
        CryptoCoin.dash => CryptoPlatformColorTheme.secondaryColor,
        CryptoCoin.dogecoin => CryptoPlatformColorTheme.secondaryColor,
        CryptoCoin.ethereum => CryptoPlatformColorTheme.quinaryColor,
        CryptoCoin.ripple => CryptoPlatformColorTheme.secondaryColor,
      };

  Color get textColor => switch (this) {
        CryptoCoin.binanceCoin => CryptoPlatformColorTheme.onTertiaryColor,
        CryptoCoin.bitcoin => CryptoPlatformColorTheme.onPrimaryColor,
        CryptoCoin.dash => CryptoPlatformColorTheme.onSecondaryColor,
        CryptoCoin.dogecoin => CryptoPlatformColorTheme.onSecondaryColor,
        CryptoCoin.ethereum => CryptoPlatformColorTheme.onQuinaryColor,
        CryptoCoin.ripple => CryptoPlatformColorTheme.onSecondaryColor,
      };

  Color get chartLineColor => switch (this) {
        CryptoCoin.binanceCoin => CryptoPlatformColorTheme.onTertiaryColor,
        CryptoCoin.bitcoin => CryptoPlatformColorTheme.onPrimaryColor,
        CryptoCoin.dash => CryptoPlatformColorTheme.onTertiaryColor,
        CryptoCoin.dogecoin => CryptoPlatformColorTheme.onSecondaryColor,
        CryptoCoin.ethereum =>
          CryptoPlatformColorTheme.positiveIndexBackgroundColor,
        CryptoCoin.ripple => CryptoPlatformColorTheme.onSecondaryColor,
      };
}
