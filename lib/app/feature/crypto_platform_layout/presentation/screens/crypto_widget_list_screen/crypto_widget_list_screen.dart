import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/app/common/constants/app_sizes.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/domain/crypto_coin.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/widgets/crypto_coin_widget.dart';
import 'package:flutter_ui_challenges/core/localization/string_hardcoded.dart';

/// Экран для проверки отображения различных вариаций виджетов.
class CryptoWidgetListScreen extends StatelessWidget {
  const CryptoWidgetListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Widget List'.hardcoded),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Sizes.p160 + Sizes.p64,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                gapW8,
                CryptoCoinWidget(
                  width: Sizes.p160,
                  coin: CryptoCoin.bitcoin,
                  indexChangePerDay: 1.2,
                  price: Decimal.parse('19384.23'),
                ),
                gapW8,
                CryptoCoinWidget(
                  width: Sizes.p160,
                  coin: CryptoCoin.ripple,
                  indexChangePerDay: 1.2,
                  price: Decimal.parse('19384.23'),
                ),
                gapW8,
                CryptoCoinWidget(
                  width: Sizes.p160,
                  coin: CryptoCoin.binanceCoin,
                  indexChangePerDay: 1.2,
                  price: Decimal.parse('19384.23'),
                ),
                gapW8,
                CryptoCoinWidget(
                  width: Sizes.p160,
                  coin: CryptoCoin.ethereum,
                  indexChangePerDay: 1.2,
                  price: Decimal.parse('19384.23'),
                ),
                gapW8,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
