import 'package:flutter_ui_challenges/app/feature/streams_example/data/repository/numbers_stream_transformer.dart';
import 'package:flutter_ui_challenges/app/feature/streams_example/data/source/numbers_database.dart';
import 'package:flutter_ui_challenges/app/feature/streams_example/data/source/numbers_database_impl.dart';
import 'package:flutter_ui_challenges/app/feature/streams_example/domain/repository/numbers_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'numbers_repository_impl.g.dart';

class NumbersRepositoryImpl implements NumbersRepository {
  final NumbersDatabase database;

  NumbersRepositoryImpl(this.database);

  @override
  Stream<List<int>> watchNumbers() {
    return database.watchNumbers();
  }

  @override
  Stream<int?> watchLastNumber() {
    return database.watchLastNumber();
  }

  @override
  Future<void> addNumber(int number) async {
    return database.addNumber(number);
  }

  @override
  Future<void> addNumbers(List<int> numbers) async {
    for (final e in numbers) {
      await database.addNumber(e);
    }
  }

  @override
  Future<void> deleteNumbers() async {
    return database.deleteNumbers();
  }
}

@riverpod
NumbersRepositoryImpl numbersRepository(NumbersRepositoryRef ref) {
  final database = ref.read(NumbersDatabaseImpl.provider);
  return NumbersRepositoryImpl(database);
}

@riverpod
Stream<List<int>> numbersStream(NumbersStreamRef ref) {
  final repository = ref.watch(numbersRepositoryProvider);
  return repository.watchNumbers();
}

@riverpod
Stream<int?> lastNumbersStream(LastNumbersStreamRef ref) {
  final repository = ref.watch(numbersRepositoryProvider);
  return repository.watchLastNumber();
}

@riverpod
Stream<int> sumNumbersStream(SumNumbersStreamRef ref) {
  final numbersStream = ref.watch(numbersRepositoryProvider).watchNumbers();
  return numbersStream.transform(
    NumbersStreamTransformer<int>(
      converter: (numbers) =>
          numbers.reduce((previous, current) => previous + current),
    ),
  );
}

@riverpod
Future<BasicProcessingMethodsResult> basicProcessingMethods(
  BasicProcessingMethodsRef ref,
) {
  final lastNumberStream =
      ref.watch(numbersRepositoryProvider).watchLastNumber();
  final tenValuesStream = lastNumberStream
      .skipWhile((element) => element == null)
      .take(10)
      .map((number) => number ?? 0);

  final futuresRecord = (
    tenValuesStream.first,
    tenValuesStream.last,
    tenValuesStream.reduce(
      (previous, current) => previous + current,
    ),
    tenValuesStream.fold(
      100,
      (previous, current) => previous + current,
    ),
  );

  final resultFuture = futuresRecord.wait;
  return resultFuture.then(
    (value) => (
      first: value.$1,
      last: value.$2,
      sum: value.$3,
      foldSum: value.$4,
    ),
  );
}

typedef BasicProcessingMethodsResult = ({
  int? first,
  int? last,
  int sum,
  int foldSum,
});
