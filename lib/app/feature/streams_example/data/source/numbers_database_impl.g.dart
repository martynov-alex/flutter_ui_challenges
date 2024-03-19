// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'numbers_database_impl.dart';

// ignore_for_file: type=lint
class $NumbersTable extends Numbers with TableInfo<$NumbersTable, NumberDto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NumbersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
      'number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, number];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'numbers';
  @override
  VerificationContext validateIntegrity(Insertable<NumberDto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NumberDto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NumberDto(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number'])!,
    );
  }

  @override
  $NumbersTable createAlias(String alias) {
    return $NumbersTable(attachedDatabase, alias);
  }
}

class NumberDto extends DataClass implements Insertable<NumberDto> {
  final int id;
  final int number;
  const NumberDto({required this.id, required this.number});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['number'] = Variable<int>(number);
    return map;
  }

  NumbersCompanion toCompanion(bool nullToAbsent) {
    return NumbersCompanion(
      id: Value(id),
      number: Value(number),
    );
  }

  factory NumberDto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NumberDto(
      id: serializer.fromJson<int>(json['id']),
      number: serializer.fromJson<int>(json['number']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'number': serializer.toJson<int>(number),
    };
  }

  NumberDto copyWith({int? id, int? number}) => NumberDto(
        id: id ?? this.id,
        number: number ?? this.number,
      );
  @override
  String toString() {
    return (StringBuffer('NumberDto(')
          ..write('id: $id, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, number);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NumberDto &&
          other.id == this.id &&
          other.number == this.number);
}

class NumbersCompanion extends UpdateCompanion<NumberDto> {
  final Value<int> id;
  final Value<int> number;
  const NumbersCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
  });
  NumbersCompanion.insert({
    this.id = const Value.absent(),
    required int number,
  }) : number = Value(number);
  static Insertable<NumberDto> custom({
    Expression<int>? id,
    Expression<int>? number,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
    });
  }

  NumbersCompanion copyWith({Value<int>? id, Value<int>? number}) {
    return NumbersCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NumbersCompanion(')
          ..write('id: $id, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }
}

abstract class _$NumbersDatabaseImpl extends GeneratedDatabase {
  _$NumbersDatabaseImpl(QueryExecutor e) : super(e);
  late final $NumbersTable numbers = $NumbersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [numbers];
}
