import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_ui_challenges/core/localization/string_hardcoded.dart';

class RadialCountdownTimerScreen extends StatelessWidget {
  const RadialCountdownTimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radial Countdown Timer'.hardcoded),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        // Use Center as layout has unconstrained width (loose constraints),
        // together with SizedBox to specify the max width (tight constraints)
        // See this thread for more info:
        // https://twitter.com/biz84/status/1445400059894542337
        child: Center(
          child: SizedBox(
            width: 300, // max allowed width
            child: CountdownAndRestart(),
          ),
        ),
      ),
    );
  }
}

/// Main demo UI (countdown + restart button)
/// Uses a Ticker to ensure the countdown ring updates with the screen vsync
/// Learn more: https://codewithandrea.com/articles/flutter-timer-vs-ticker/
class CountdownAndRestart extends StatefulWidget {
  const CountdownAndRestart({super.key});

  @override
  CountdownAndRestartState createState() => CountdownAndRestartState();
}

class CountdownAndRestartState extends State<CountdownAndRestart>
    with SingleTickerProviderStateMixin {
  static const maxWidth = 300.0;
  // countdown duration
  static const timeoutInSeconds = 10;
  // elapsed time
  Duration _elapsed = Duration.zero;

  // derived values
  // remaining time (capped to 0 to avoid negative numbers)
  int get _remainingTime => max(0, timeoutInSeconds - _elapsed.inSeconds);
  // do the calculation in milliseconds for better precision
  double get _countdownProgress =>
      _elapsed.inMilliseconds / (1000 * timeoutInSeconds.toDouble());

  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    // create ticker
    _ticker = createTicker((elapsed) {
      setState(() => _elapsed = elapsed);
      // after timeout, stop ticker to avoid unnecessary rebuilds
      if (_elapsed.inSeconds >= timeoutInSeconds) {
        _ticker.stop();
      }
    });
    // and start it
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _restart() {
    _ticker.stop();
    _ticker.start();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CountdownRenderer(
          progress: _countdownProgress,
          remainingTime: _remainingTime,
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: _restart,
          child: const Text(
            'Restart',
            style: TextStyle(fontSize: 32),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class CountdownRenderer extends StatelessWidget {
  const CountdownRenderer({
    super.key,
    required this.progress,
    required this.remainingTime,
  });
  final double progress;
  final int remainingTime;

  static const _color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Stack(
        children: [
          // * can be swapped with RingWithCustomPainter
          RingWithCustomPainter(
            progress: progress,
            foregroundColor: _color.shade700,
            backgroundColor: _color.shade200,
          ),
          Center(
            child: RemainingTimeText(
              remaining: remainingTime,
              color: _color.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

class RemainingTimeText extends StatelessWidget {
  const RemainingTimeText({
    super.key,
    required this.remaining,
    required this.color,
  });
  final int remaining;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Text(
          remaining.toString(),
          style: TextStyle(
            fontSize: width / 2,
            color: color,
          ),
        );
      },
    );
  }
}

/// Simple ring implementation that uses a CircularProgressIndicator
class RingWithoutCustomPainter extends StatelessWidget {
  const RingWithoutCustomPainter({
    super.key,
    required this.progress,
    required this.foregroundColor,
    required this.backgroundColor,
  });
  final double progress;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final strokeWidth = constraints.maxWidth / 15.0;

        return AspectRatio(
          aspectRatio: 1.0,
          child: Padding(
            // Use padding to ensure we don't go beyond the constraints
            padding: EdgeInsets.all(strokeWidth / 2.0),
            child: Transform(
              alignment: Alignment.center,
              // Rotate 180 degrees to "flip" the animation horizontally
              transform: Matrix4.rotationY(pi),
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: strokeWidth,
                valueColor: AlwaysStoppedAnimation<Color>(backgroundColor),
                backgroundColor: foregroundColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

/// More advanced implementation that uses a custom painter
class RingWithCustomPainter extends StatelessWidget {
  const RingWithCustomPainter({
    super.key,
    required this.progress,
    required this.foregroundColor,
    required this.backgroundColor,
  });
  final double progress;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: CustomPaint(
        painter: RingPainter(
          progress: progress,
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  RingPainter({
    required this.progress,
    required this.foregroundColor,
    required this.backgroundColor,
  });
  final double progress;
  final Color foregroundColor;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width / 15.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final backgroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = foregroundColor
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, backgroundPaint);

    final foregroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = backgroundColor
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      -2 * pi * progress,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant RingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
