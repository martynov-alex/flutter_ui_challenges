import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_challenges/app/common/constants/app_sizes.dart';
import 'package:flutter_ui_challenges/app/common/ui/widgets/async_value_widget.dart';
import 'package:flutter_ui_challenges/app/feature/streams_example/data/repository/numbers_repository_impl.dart';
import 'package:flutter_ui_challenges/core/localization/string_hardcoded.dart';
import 'package:flutter_ui_challenges/core/utils/extensions/theme_x.dart';

class StreamsExampleScreen extends ConsumerWidget {
  const StreamsExampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.read(numbersRepositoryProvider);
    final numbersValue = ref.watch(numbersStreamProvider);

    final titleStyle = context.textTheme.titleMedium?.copyWith(
      color: context.colorScheme.primary,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Streams'.hardcoded),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async => repository.addNumber(1),
                child: Text('Добавить 1'.hardcoded),
              ),
              ElevatedButton(
                onPressed: () async => repository.addNumbers([2, 3]),
                child: Text('Добавить 2, 3'.hardcoded),
              ),
              ElevatedButton(
                onPressed: () async => repository.addNumbers([4, 5, 6]),
                child: Text('Добавить 4, 5, 6'.hardcoded),
              ),
              gapH16,
              ElevatedButton(
                onPressed: () async => repository.deleteNumbers(),
                child: Text('Удалить все'.hardcoded),
              ),
              gapH16,
              Text(
                'Поток всех чисел'.hardcoded,
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
              AsyncValueWidget<List<int>>(
                value: numbersValue,
                data: (numbers) => SizedBox(
                  height: Sizes.p24,
                  child: numbers.isEmpty
                      ? Center(child: Text('Чисел пока нет'.hardcoded))
                      : Text(numbers.toString()),
                ),
              ),
              gapH16,
              Text(
                'Поток последнего добавленного числа'.hardcoded,
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
              Consumer(
                builder: (_, ref, __) {
                  final lastNumbersValue = ref.watch(lastNumbersStreamProvider);

                  return AsyncValueWidget<int?>(
                    value: lastNumbersValue,
                    data: (number) => SizedBox(
                      height: Sizes.p24,
                      child: number == null
                          ? Text('Чисел пока нет'.hardcoded)
                          : Text('Последнее число: $number'.hardcoded),
                    ),
                  );
                },
              ),
              gapH16,
              Text(
                'Поток суммы чисел'.hardcoded,
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
              Consumer(
                builder: (_, ref, __) {
                  final sumNumbersValue = ref.watch(sumNumbersStreamProvider);

                  return AsyncValueWidget<int>(
                    value: sumNumbersValue,
                    data: (sum) => SizedBox(
                      height: Sizes.p24,
                      child: Text(sum.toString()),
                    ),
                  );
                },
              ),
              gapH16,
              Text(
                'Обработка последних 10 значений'.hardcoded,
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
              Consumer(
                builder: (_, ref, __) {
                  final basicProcessingMethodsResultValue = ref.watch(
                    basicProcessingMethodsProvider,
                  );

                  return AsyncValueWidget<BasicProcessingMethodsResult>(
                    value: basicProcessingMethodsResultValue,
                    data: (result) => SizedBox(
                      height: Sizes.p96,
                      child: Center(
                        child: Text(
                          'Первое: ${result.first},\nПоследнее: ${result.last},\nСумма: ${result.sum},\n+100 к сумме: ${result.foldSum}'
                              .hardcoded,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    indicatorSize: const Size(Sizes.p96, Sizes.p96),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
