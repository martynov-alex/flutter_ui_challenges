import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/domain/crypto_coin.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/theme/crypto_platform_color_theme.dart';
import 'package:flutter_ui_challenges/core/assets/cryptocurrency_icons.dart';

extension CryptoCoinUIX on CryptoCoin {
  String get icon => switch (this) {
        CryptoCoin.binanceCoin => CryptocurrencyIcons.bnb,
        CryptoCoin.bitcoin => CryptocurrencyIcons.btc,
        CryptoCoin.dash => CryptocurrencyIcons.dash,
        CryptoCoin.dogecoin => CryptocurrencyIcons.doge,
        CryptoCoin.ethereum => CryptocurrencyIcons.eth,
        CryptoCoin.ripple => CryptocurrencyIcons.xrp,
      };

  Color get backgroundColor => switch (this) {
        CryptoCoin.binanceCoin => CryptoPlatformColorTheme.tertiaryColor,
        CryptoCoin.bitcoin => CryptoPlatformColorTheme.primaryColor,
        CryptoCoin.dash => CryptoPlatformColorTheme.tertiaryColor,
        CryptoCoin.dogecoin => CryptoPlatformColorTheme.secondaryColor,
        CryptoCoin.ethereum => CryptoPlatformColorTheme.quinaryColor,
        CryptoCoin.ripple => CryptoPlatformColorTheme.secondaryColor,
      };

  Color get favoriteCoinTextColor => switch (this) {
        CryptoCoin.binanceCoin => CryptoPlatformColorTheme.onTertiaryColor,
        CryptoCoin.bitcoin => CryptoPlatformColorTheme.onPrimaryColor,
        CryptoCoin.dash => CryptoPlatformColorTheme.onTertiaryColor,
        CryptoCoin.dogecoin => CryptoPlatformColorTheme.onSecondaryColor,
        CryptoCoin.ethereum => CryptoPlatformColorTheme.onQuinaryColor,
        CryptoCoin.ripple => CryptoPlatformColorTheme.onSecondaryColor,
      };

  Color get favoriteCoinChartLineColor => switch (this) {
        CryptoCoin.binanceCoin => CryptoPlatformColorTheme.onTertiaryColor,
        CryptoCoin.bitcoin => CryptoPlatformColorTheme.onPrimaryColor,
        CryptoCoin.dash => CryptoPlatformColorTheme.onTertiaryColor,
        CryptoCoin.dogecoin => CryptoPlatformColorTheme.onSecondaryColor,
        CryptoCoin.ethereum =>
          CryptoPlatformColorTheme.positiveIndexBackgroundColor,
        CryptoCoin.ripple => CryptoPlatformColorTheme.onSecondaryColor,
      };
}
