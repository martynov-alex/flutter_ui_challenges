import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/app/common/constants/app_sizes.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/domain/crypto_coin.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/widgets/crypto_chart_widget.dart';
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
          _CryptoFavoriteCoinWidgets(),
          gapH4,
          _CryptoChartWidget(),
        ],
      ),
    );
  }
}

class _CryptoFavoriteCoinWidgets extends StatelessWidget {
  const _CryptoFavoriteCoinWidgets();

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
            chartData: _generateChatData(initialY: 19000),
            price: Decimal.parse('19384'),
            indexChangePerDay: 1.4,
            width: Sizes.p160,
          ),
          gapW8,
          CryptoFavoriteCoinWidget(
            coin: CryptoCoin.ripple,
            chartData: _generateChatData(initialY: 380),
            price: Decimal.parse('384.23'),
            indexChangePerDay: 8.3,
            width: Sizes.p160,
          ),
          gapW8,
          CryptoFavoriteCoinWidget(
            coin: CryptoCoin.binanceCoin,
            chartData: _generateChatData(initialY: 4),
            price: Decimal.parse('4.2333'),
            indexChangePerDay: -231.2,
            width: Sizes.p160,
          ),
          gapW8,
          CryptoFavoriteCoinWidget(
            coin: CryptoCoin.ethereum,
            chartData: _generateChatData(initialY: 1900),
            price: Decimal.parse('1938.23'),
            indexChangePerDay: -2.2,
            width: Sizes.p160,
          ),
        ],
      ),
    );
  }
}

class _CryptoChartWidget extends StatelessWidget {
  const _CryptoChartWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p4),
      child: CryptoChartWidget(
        coin: CryptoCoin.dash,
        chartData: _generateChatData(initialY: 40, spotsNumber: 50),
        price: Decimal.parse('40.86'),
        indexChangePerDay: 1.4,
        height: 300,
      ),
    );
  }
}

List<FlSpot> _generateChatData({
  required double initialY,
  int spotsNumber = 30,
}) {
  final random = Random();
  final isGrowing = random.nextBool();
  double y = initialY;
  final step = initialY * 0.01;

  final List<FlSpot> spots = List.generate(
    spotsNumber,
    (index) {
      final x = index.toDouble();
      final change = random.nextDouble() * step;

      random.nextInt(10) > 2
          ? isGrowing
              ? y += change
              : y -= change
          : isGrowing
              ? y -= change
              : y += change;

      return FlSpot(x, y);
    },
  );
  return spots;
}
