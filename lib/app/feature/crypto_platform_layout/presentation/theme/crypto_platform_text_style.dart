import 'package:flutter/material.dart';

const _britanicaFontFamily = 'Britanica';
const _britanicaSemiExpandedFontFamily = 'Britanica Semi Expanded';
const _britanicaExpandedFontFamily = 'Britanica Expanded';

/// Набор типографии приложения.
///
/// Содержит конкретные текстовые стили для UI-элементов.
abstract class CryptoPlatformTextStyle {
  /// Шрифты с толщиной light
  static final britanicaLight = _BritanicaLight();

  /// Шрифты с толщиной regular
  static final britanicaRegular = _BritanicaRegular();

  /// Шрифты с толщиной bold
  static final britanicaBold = _BritanicaBold();

  /// Шрифты с толщиной extra bold
  static final britanicaExtraBold = _BritanicaExtraBold();

  /// Шрифты с толщиной black
  static final britanicaBlack = _BritanicaBlack();

  /// Шрифты с толщиной regular
  static final britanicaSemiExpandedRegular = _BritanicaSemiExpandedRegular();

  /// Шрифты с толщиной bold
  static final britanicaSemiExpandedBold = _BritanicaSemiExpandedBold();

  /// Шрифты с толщиной regular
  static final britanicaExpandedRegular = _BritanicaExpandedRegular();

  /// Шрифты с толщиной bold
  static final britanicaExpandedBold = _BritanicaExpandedBold();
}

class _BritanicaLight {
  TextStyle size12 = const TextStyle(
    fontFamily: _britanicaFontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 12.0,
  );
  TextStyle size14 = const TextStyle(
    fontFamily: _britanicaFontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 14.0,
  );
}

class _BritanicaRegular {
  TextStyle size12 = const TextStyle(
    fontFamily: _britanicaFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
  );
  TextStyle size14 = const TextStyle(
    fontFamily: _britanicaFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
  );
}

class _BritanicaBold {
  TextStyle size12 = const TextStyle(
    fontFamily: _britanicaFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 12.0,
  );
  TextStyle size14 = const TextStyle(
    fontFamily: _britanicaFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
  );
}

class _BritanicaExtraBold {
  TextStyle size12 = const TextStyle(
    fontFamily: _britanicaFontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 12.0,
  );
  TextStyle size14 = const TextStyle(
    fontFamily: _britanicaFontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 14.0,
  );
}

class _BritanicaBlack {
  TextStyle size12 = const TextStyle(
    fontFamily: _britanicaFontFamily,
    fontWeight: FontWeight.w900,
    fontSize: 12.0,
  );
  TextStyle size14 = const TextStyle(
    fontFamily: _britanicaFontFamily,
    fontWeight: FontWeight.w900,
    fontSize: 14.0,
  );
  TextStyle size16 = const TextStyle(
    fontFamily: _britanicaFontFamily,
    fontWeight: FontWeight.w900,
    fontSize: 16.0,
  );
}

class _BritanicaSemiExpandedRegular {
  TextStyle size12 = const TextStyle(
    fontFamily: _britanicaSemiExpandedFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
  );
  TextStyle size14 = const TextStyle(
    fontFamily: _britanicaSemiExpandedFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
  );
}

class _BritanicaSemiExpandedBold {
  TextStyle size12 = const TextStyle(
    fontFamily: _britanicaSemiExpandedFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 12.0,
  );
  TextStyle size14 = const TextStyle(
    fontFamily: _britanicaSemiExpandedFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
  );
}

class _BritanicaExpandedRegular {
  TextStyle size11 = const TextStyle(
    fontFamily: _britanicaExpandedFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 11.0,
  );

  TextStyle size12 = const TextStyle(
    fontFamily: _britanicaExpandedFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
  );

  TextStyle size14 = const TextStyle(
    fontFamily: _britanicaExpandedFontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
  );
}

class _BritanicaExpandedBold {
  TextStyle size12 = const TextStyle(
    fontFamily: _britanicaExpandedFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 12.0,
  );

  TextStyle size20 = const TextStyle(
    fontFamily: _britanicaExpandedFontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
  );
}
