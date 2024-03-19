import 'dart:async';

/// Трансформер для преобразования списка чисел в [T] c использование функции
/// конвертации [converter].
class NumbersStreamTransformer<T> extends StreamTransformerBase<List<int>, T> {
  final T Function(List<int> list) converter;

  NumbersStreamTransformer({required this.converter});

  @override
  Stream<T> bind(Stream<List<int>> stream) {
    // Создаем подписку на входящий поток.
    StreamSubscription<List<int>>? subscription;

    // Для генерации выходного стрима с данными типа T создаем контроллер.
    final controller = StreamController<T>(
      // Если мы отпишемся от результирующего стрима (например, используем
      // только first значение), то и исходный нам больше не нужен - закрываем.
      // При этом при закрытии подписки на исходный стрим, закрывается и контроллер.
      onCancel: () => subscription?.cancel(),

      // Аналогично можно поставить на паузу и продолжить преобразование
      // (верно только для Single Subscription)
      onPause: () => subscription?.pause(),
      onResume: () => subscription?.resume(),
    );

    // Пишем listen для входящего потока.
    subscription = stream.asyncMap<List<int>>(
      // Преобразования исходного потока с Future могут быть тут:
      (sourceList) async {
        await Future.delayed(const Duration(seconds: 1));
        final modifiedList = sourceList; // тут могут быть преобразования
        return modifiedList;
      },
    ).listen(
      // Трансформируем данные через функцию [converter] и добавляем в
      // результирующий поток
      (modifiedList) {
        if (modifiedList.isNotEmpty) {
          final result = converter.call(modifiedList);
          controller.add(result);
        }
      },

      // Ошибку переправляем также в результирующий стрим.
      onError: (Object error, StackTrace stacktrace) =>
          controller.addError(error, stacktrace),

      // Закрываем контроллер, когда исходный стрим прекращает работу.
      onDone: () => controller.close(),
    );

    // Возвращаем стрим
    return controller.stream;
  }
}
