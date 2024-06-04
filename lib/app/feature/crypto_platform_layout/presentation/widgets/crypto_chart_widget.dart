import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/app/common/constants/app_sizes.dart';
import 'package:flutter_ui_challenges/app/common/ui/widgets/svg_icon.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/domain/crypto_coin.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/data/crypto_coin_ui_x.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/theme/crypto_platform_color_theme.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/theme/crypto_platform_text_style.dart';
import 'package:flutter_ui_challenges/app/feature/crypto_platform_layout/presentation/widgets/crypto_index_change_widget.dart';
import 'package:flutter_ui_challenges/core/utils/extensions/decimal_x.dart';

class CryptoChartWidget extends StatelessWidget {
  const CryptoChartWidget({
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
    return SizedBox(
      height: height,
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: CryptoPlatformColorTheme.quinaryColor,
          borderRadius: BorderRadius.circular(Sizes.p24),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: Sizes.p24,
            left: Sizes.p24,
            right: Sizes.p24,
            bottom: Sizes.p16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(coin, price, indexChangePerDay),
              gapH16,
              Expanded(child: _Chart(chartData, coin)),
              gapH16,
              const _PeriodSwitcher(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(this.coin, this.price, this.indexChangePerDay);

  final CryptoCoin coin;
  final Decimal price;
  final double indexChangePerDay;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.square(
          dimension: Sizes.p40,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: coin.backgroundColor,
              borderRadius: BorderRadius.circular(Sizes.p12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(Sizes.p8),
              child: SvgIcon(
                asset: coin.icon,
                color: coin.textColor,
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
                style: CryptoPlatformTextStyle.britanicaBlack.size14
                    .copyWith(color: CryptoPlatformColorTheme.onQuinaryColor),
                overflow: TextOverflow.fade,
                softWrap: false,
                maxLines: 1,
              ),
              gapW4,
              Text(
                price.format(),
                style: CryptoPlatformTextStyle.britanicaBlack.size12
                    .copyWith(color: CryptoPlatformColorTheme.onQuinaryColor),
              ),
            ],
          ),
        ),
        const Spacer(),
        CryptoIndexChangeWidget(indexChangePerDay),
      ],
    );
  }
}

class _Chart extends StatelessWidget {
  const _Chart(this.chartData, this.coin);

  final List<FlSpot> chartData;
  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: chartData,
            color: CryptoPlatformColorTheme.onQuinaryColor,
            dotData: const FlDotData(show: false),
            isCurved: true,
          ),
        ],
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipRoundedRadius: Sizes.p8,
            getTooltipColor: (touchedSpot) => coin.backgroundColor,
            getTooltipItems: (touchedSpots) => touchedSpots
                .map(
                  (spot) => LineTooltipItem(
                    Decimal.parse(spot.y.toString()).format(),
                    CryptoPlatformTextStyle.britanicaBlack.size14.copyWith(
                      color: coin.textColor,
                    ),
                  ),
                )
                .toList(),
          ),
          getTouchedSpotIndicator: (barData, spotIndexes) => spotIndexes
              .map(
                (spotIndex) => TouchedSpotIndicatorData(
                  const FlLine(color: Colors.transparent),
                  FlDotData(
                    getDotPainter: (_, __, ___, ____) => FlDotCirclePainter(
                      radius: Sizes.p4,
                      color: coin.backgroundColor,
                      strokeColor: CryptoPlatformColorTheme.onQuinaryColor,
                      strokeWidth: 2.0,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _PeriodSwitcher extends StatefulWidget {
  const _PeriodSwitcher();

  @override
  State<_PeriodSwitcher> createState() => _PeriodSwitcherState();
}

class _PeriodSwitcherState extends State<_PeriodSwitcher> {
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        _Period.values.length,
        (index) => Expanded(
          child: FilledButton(
            onPressed: () => setState(() => selectedButtonIndex = index),
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: Sizes.p8,
                ),
              ),
              backgroundColor: WidgetStateProperty.all(
                index == selectedButtonIndex
                    ? CryptoPlatformColorTheme.onQuinaryColor
                    : CryptoPlatformColorTheme.quinaryColor,
              ),
              minimumSize: WidgetStateProperty.all(Size.zero),
            ),
            child: Text(
              _Period.values[index].title,
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: CryptoPlatformTextStyle.britanicaExpandedRegular.size12
                  .copyWith(
                color: index == selectedButtonIndex
                    ? CryptoPlatformColorTheme.quinaryColor
                    : CryptoPlatformColorTheme.onQuinaryColor,
              ),
            ),
          ),
        ),
      ).toList(),
    );
  }
}

enum _Period {
  day('24H'),
  week('1W'),
  year('1Y'),
  fiveYears('5Y'),
  all('All'),
  ;

  const _Period(this.title);

  final String title;
}
