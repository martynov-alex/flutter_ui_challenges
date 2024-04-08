import 'package:flutter/material.dart';

const _britanicaFontFamily = 'Britanica';

/// Набор типографии приложения.
///
/// Содержит конкретные текстовые стили для UI-элементов.
abstract class AppTextStyles {
  /// Шрифты с толщиной light
  static final britanicaLight = _BritanicaLight();

  /// Шрифты с толщиной regular
  static final britanicaRegular = _BritanicaRegular();

  /// Шрифты с толщиной medium
  static final britanicaMedium = _BritanicaMedium();

  /// Шрифты с толщиной bold
  static final britanicaBold = _BritanicaBold();
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

class _BritanicaMedium {
  TextStyle size12 = const TextStyle(
    fontFamily: _britanicaFontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
  );
  TextStyle size14 = const TextStyle(
    fontFamily: _britanicaFontFamily,
    fontWeight: FontWeight.w500,
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
