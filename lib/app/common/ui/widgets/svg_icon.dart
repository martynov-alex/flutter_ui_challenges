import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    super.key,
    required this.asset,
    this.color,
    this.width,
    this.height,
  });

  final String asset;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final colorFilter =
        color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null;

    return SvgPicture.asset(
      asset,
      colorFilter: colorFilter,
      width: width,
      height: height,
    );
  }
}
