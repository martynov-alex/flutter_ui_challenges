import 'package:flutter_ui_challenges/app/common/constants/app_sizes.dart';
import 'package:flutter_ui_challenges/core/utils/extensions/theme_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    required this.value,
    required this.data,
    this.indicatorSize = const Size(Sizes.p64, Sizes.p24),
    this.error,
    this.loading,
    super.key,
  });

  final AsyncValue<T> value;
  final Size indicatorSize;
  final Widget Function(T) data;
  final Widget Function(Object, StackTrace)? error;
  final Widget Function()? loading;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: error ?? (e, st) => Center(child: Text(e.toString())),
      loading: loading ??
          () => Center(
                child: SizedBox(
                  width: indicatorSize.width,
                  child: LinearProgressIndicator(
                    minHeight: indicatorSize.height,
                    borderRadius: BorderRadius.circular(Sizes.p24),
                    color: context.colorScheme.primary.withOpacity(0.05),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
    );
  }
}
