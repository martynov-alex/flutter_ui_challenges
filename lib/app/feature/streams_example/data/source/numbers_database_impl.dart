import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_challenges/app/common/data/source/database/connection/connection.dart'
    as impl;
import 'package:flutter_ui_challenges/app/feature/streams_example/data/mapper/numbers_mapper.dart';
import 'package:flutter_ui_challenges/app/feature/streams_example/data/source/numbers_database.dart';
import 'package:flutter_ui_challenges/app/feature/streams_example/data/source/numbers_tables.dart';

part 'numbers_database_impl.g.dart';

@DriftDatabase(tables: [Numbers])
class NumbersDatabaseImpl extends _$NumbersDatabaseImpl
    implements NumbersDatabase {
  NumbersDatabaseImpl({
    required this.dbName,
    required this.inMemory,
    required this.logStatements,
  }) : super(
          impl.connect(
            dbName,
            inMemory: inMemory,
            logStatements: logStatements,
          ),
        );

  final String dbName;
  final bool inMemory;
  final bool logStatements;

  @override
  int get schemaVersion => 1;

  NumbersDatabaseImpl.forTesting(
    DatabaseConnection super.connection, {
    required this.dbName,
    required this.inMemory,
    required this.logStatements,
  });

  // Инициализация БД происходит при создании провайдера.
  static final StateProvider<NumbersDatabaseImpl> provider =
      StateProvider((ref) {
    final database = NumbersDatabaseImpl(
      dbName: 'numbers.db',
      inMemory: true,
      logStatements: false,
    );
    ref.onDispose(database.close);

    return database;
  });

  @override
  Stream<List<int>> watchNumbers() {
    final query = select(numbers);

    return query.map(NumbersMapper.fromDto).watch();
  }

  @override
  Stream<int?> watchLastNumber() {
    final query = select(numbers)
      ..orderBy([
        (tbl) => OrderingTerm(expression: tbl.id, mode: OrderingMode.desc),
      ])
      ..limit(1);

    return query.map(NumbersMapper.fromDto).watchSingleOrNull();
  }

  @override
  Future<void> addNumber(int number) {
    return into(numbers).insert(
      NumbersCompanion.insert(number: number),
    );
  }

  @override
  Future<void> addNumbers(List<int> numbersList) async {
    await batch((batch) {
      batch.insertAll(
        numbers,
        numbersList
            .map((number) => NumbersCompanion.insert(number: number))
            .toList(),
      );
    });
  }

  @override
  Future<void> deleteNumbers() {
    return delete(numbers).go();
  }
}
