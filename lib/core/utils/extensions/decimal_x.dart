import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:intl/intl.dart';

extension DecimalX on Decimal {
  String formatWith(NumberFormat formatter) {
    final decimalFormatter = DecimalFormatter(formatter);
    return decimalFormatter.format(this);
  }

  String format([String? locale]) {
    final decimalDigits = switch (toDouble()) {
      < 1 => 7,
      < 10 => 4,
      < 10000 => 2,
      _ => 0,
    };

    final formatter = NumberFormat.simpleCurrency(
      locale: locale ?? 'en-US',
      decimalDigits: decimalDigits,
    );

    final decimalFormatter = DecimalFormatter(formatter);

    return decimalFormatter.format(this);
  }
}
