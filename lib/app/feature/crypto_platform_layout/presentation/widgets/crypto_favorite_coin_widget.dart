import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_challenges/app/common/constants/app_sizes.dart';
import 'package:flutter_ui_challenges/app/common/ui/widgets/svg_icon.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/domain/crypto_coin.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/data/crypto_coin_ui_x.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/theme/crypto_platform_text_style.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/widgets/crypto_index_change_widget.dart';
import 'package:flutter_ui_challenges/core/utils/color_utils.dart';
import 'package:flutter_ui_challenges/core/utils/extensions/decimal_x.dart';

class CryptoFavoriteCoinWidget extends StatelessWidget {
  const CryptoFavoriteCoinWidget({
    required this.coin,
    required this.chartData,
    required this.price,
    required this.indexChangePerDay,
    this.height,
    this.width,
    super.key,
  });

  final CryptoCoin coin;
  final List<FlSpot> chartData;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(coin),
              gapH8,
              Expanded(
                child: _Chart(chartData, coin.chartLineColor),
              ),
              gapH8,
              Text(
                price.format(),
                style: CryptoPlatformTextStyle.britanicaExpandedBold.size20
                    .copyWith(color: textColor),
              ),
              gapH8,
              CryptoIndexChangeWidget(indexChangePerDay),
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
              child: SvgIcon(asset: coin.icon, color: coin.textColor),
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
                style: CryptoPlatformTextStyle.britanicaBold.size14
                    .copyWith(color: coin.textColor),
                overflow: TextOverflow.fade,
                softWrap: false,
                maxLines: 1,
              ),
              gapW4,
              Text(
                coin.ticker,
                style: CryptoPlatformTextStyle.britanicaRegular.size12
                    .copyWith(color: coin.textColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Chart extends StatelessWidget {
  const _Chart(this.chartData, this.chartColor);

  final List<FlSpot> chartData;
  final Color chartColor;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: chartData,
            color: chartColor,
            barWidth: 1,
            isCurved: true,
            dotData: const FlDotData(show: false),
          ),
        ],
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
        lineTouchData: const LineTouchData(enabled: false),
      ),
    );
  }
}
