import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/app/common/constants/app_sizes.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/domain/crypto_coin.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/widgets/crypto_favorite_coin_widget.dart';
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
      body: const Column(
        children: [
          _CryptoCoinWidgets(),
        ],
      ),
    );
  }
}

class _CryptoCoinWidgets extends StatelessWidget {
  const _CryptoCoinWidgets();

  List<FlSpot> _generateChatData() {
    final random = Random();
    final List<FlSpot> spots = List.generate(
      10,
      (index) => FlSpot(index.toDouble(), random.nextInt(10).toDouble()),
    );
    return spots;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p192 + Sizes.p24,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
        children: [
          CryptoFavoriteCoinWidget(
            coin: CryptoCoin.bitcoin,
            chartData: _generateChatData(),
            price: Decimal.parse('19384'),
            indexChangePerDay: 1.4,
            width: Sizes.p160,
          ),
          gapW8,
          CryptoFavoriteCoinWidget(
            coin: CryptoCoin.ripple,
            chartData: _generateChatData(),
            price: Decimal.parse('384.23'),
            indexChangePerDay: 8.3,
            width: Sizes.p160,
          ),
          gapW8,
          CryptoFavoriteCoinWidget(
            coin: CryptoCoin.binanceCoin,
            chartData: _generateChatData(),
            price: Decimal.parse('4.2333'),
            indexChangePerDay: -231.2,
            width: Sizes.p160,
          ),
          gapW8,
          CryptoFavoriteCoinWidget(
            coin: CryptoCoin.ethereum,
            chartData: _generateChatData(),
            price: Decimal.parse('1938.23'),
            indexChangePerDay: -2.2,
            width: Sizes.p160,
          ),
        ],
      ),
    );
  }
}
