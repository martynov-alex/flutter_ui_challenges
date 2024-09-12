import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/core/localization/string_hardcoded.dart';

class Pushable3DButtonScreen extends StatelessWidget {
  const Pushable3DButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Embed Card'.hardcoded),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        // Use Center as layout has unconstrained width (loose constraints),
        // together with SizedBox to specify the max width (tight constraints)
        // See this thread for more info:
        // https://twitter.com/biz84/status/1445400059894542337
        child: Center(
          child: SizedBox(
            width: 400, // max allowed width
            child: PushableButtonPage(),
          ),
        ),
      ),
    );
  }
}

class PushableButtonPage extends StatefulWidget {
  const PushableButtonPage({super.key});

  @override
  State<PushableButtonPage> createState() => _PushableButtonPageState();
}

class _PushableButtonPageState extends State<PushableButtonPage> {
  String _selection = 'none';

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
    final shadow = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 4,
      offset: const Offset(0, 2),
    );

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PushableButton(
                height: 60,
                hslColor: const HSLColor.fromAHSL(1.0, 356, 1.0, 0.43),
                shadow: shadow,
                onPressed: () => setState(() => _selection = '1'),
                child: const Text('PUSH ME', style: textStyle),
              ),
              const SizedBox(height: 32),
              PushableButton(
                height: 60,
                hslColor: const HSLColor.fromAHSL(1.0, 120, 1.0, 0.37),
                shadow: shadow,
                onPressed: () => setState(() => _selection = '2'),
                child: const Text('ENROLL NOW', style: textStyle),
              ),
              const SizedBox(height: 32),
              PushableButton(
                height: 60,
                hslColor: const HSLColor.fromAHSL(1.0, 195, 1.0, 0.43),
                shadow: shadow,
                onPressed: () => setState(() => _selection = '3'),
                child: const Text('ADD TO BASKET', style: textStyle),
              ),
              const SizedBox(height: 32),
              Text(
                'Pushed: $_selection',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A widget to show a "3D" pushable button
class PushableButton extends StatefulWidget {
  const PushableButton({
    super.key,
    this.child,
    required this.hslColor,
    required this.height,
    this.elevation = 8.0,
    this.shadow,
    this.onPressed,
  }) : assert(height > 0);

  /// Child widget (normally a Text or Icon)
  final Widget? child;

  /// Color of the top layer
  /// The color of the bottom layer is derived by decreasing the luminosity by 0.15
  final HSLColor hslColor;

  /// Height of the top layer
  final double height;

  /// Elevation or "gap" between the top and bottom layer
  final double elevation;

  /// An optional shadow to make the button look better
  /// This is added to the bottom layer only
  final BoxShadow? shadow;

  /// Button pressed callback
  final VoidCallback? onPressed;

  @override
  State<PushableButton> createState() => _PushableButtonState();
}

class _PushableButtonState extends State<PushableButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  static const animationDuration = Duration(milliseconds: 50);

  bool _isDragInProgress = false;
  Offset _gestureLocation = Offset.zero;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _gestureLocation = details.localPosition;
    _animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    // Small delay to ensure the forward animation completes before reversing
    Future.delayed(animationDuration, () {
      _animationController.reverse();
    });
    widget.onPressed?.call();
  }

  void _handleTapCancel() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!_isDragInProgress && mounted) {
        _animationController.reverse();
      }
    });
  }

  void _handleDragStart(DragStartDetails details) {
    _gestureLocation = details.localPosition;
    _isDragInProgress = true;
    _animationController.forward();
  }

  void _handleDragEnd(Size buttonSize) {
    if (_isDragInProgress) {
      _isDragInProgress = false;
      _animationController.reverse();
    }
    if (_gestureLocation.dx >= 0 &&
        _gestureLocation.dx < buttonSize.width &&
        _gestureLocation.dy >= 0 &&
        _gestureLocation.dy < buttonSize.height) {
      widget.onPressed?.call();
    }
  }

  void _handleDragCancel() {
    if (_isDragInProgress) {
      _isDragInProgress = false;
      _animationController.reverse();
    }
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _gestureLocation = details.localPosition;
  }

  @override
  Widget build(BuildContext context) {
    final totalHeight = widget.height + widget.elevation;

    return SizedBox(
      height: totalHeight,
      child: LayoutBuilder(
        builder: (_, constraints) {
          final buttonSize = Size(constraints.maxWidth, constraints.maxHeight);

          return GestureDetector(
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            onHorizontalDragStart: _handleDragStart,
            onHorizontalDragEnd: (_) => _handleDragEnd(buttonSize),
            onHorizontalDragCancel: _handleDragCancel,
            onHorizontalDragUpdate: _handleDragUpdate,
            onVerticalDragStart: _handleDragStart,
            onVerticalDragEnd: (_) => _handleDragEnd(buttonSize),
            onVerticalDragCancel: _handleDragCancel,
            onVerticalDragUpdate: _handleDragUpdate,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (_, child) {
                final top = _animationController.value * widget.elevation;
                final hslColor = widget.hslColor;
                final bottomHslColor =
                    hslColor.withLightness(hslColor.lightness - 0.15);

                return Stack(
                  children: [
                    // Draw bottom layer first
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: widget.height,
                        decoration: BoxDecoration(
                          color: bottomHslColor.toColor(),
                          boxShadow:
                              widget.shadow != null ? [widget.shadow!] : [],
                          borderRadius:
                              BorderRadius.circular(widget.height / 2),
                        ),
                      ),
                    ),
                    // Then top (pushable) layer
                    Positioned(
                      left: 0,
                      right: 0,
                      top: top,
                      child: Container(
                        height: widget.height,
                        decoration: ShapeDecoration(
                          color: hslColor.toColor(),
                          shape: const StadiumBorder(),
                        ),
                        child: child,
                      ),
                    ),
                  ],
                );
              },
              child: Center(child: widget.child),
            ),
          );
        },
      ),
    );
  }
}
