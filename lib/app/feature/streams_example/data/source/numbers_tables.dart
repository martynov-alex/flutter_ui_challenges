import 'package:drift/drift.dart';

@DataClassName('NumberDto')
class Numbers extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get number => integer()();
}
