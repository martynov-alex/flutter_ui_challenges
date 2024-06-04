import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

/// Helper widget to render a SVG picture from a given asset
class VectorIcon extends StatelessWidget {
  const VectorIcon({
    super.key,
    required this.asset,
    required this.color,
    this.width,
    this.height,
  });
  final String asset;
  final Color color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return VectorGraphic(
      loader: AssetBytesLoader(asset),
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      width: width,
      height: height,
    );
  }
}
