// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Record extends DataClass implements Insertable<Record> {
  final int id;
  final String gratefulFor;
  final DateTime date;
  Record({@required this.id, @required this.gratefulFor, @required this.date});
  factory Record.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Record(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      gratefulFor: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}grateful_for']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || gratefulFor != null) {
      map['grateful_for'] = Variable<String>(gratefulFor);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  RecordsCompanion toCompanion(bool nullToAbsent) {
    return RecordsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      gratefulFor: gratefulFor == null && nullToAbsent
          ? const Value.absent()
          : Value(gratefulFor),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory Record.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Record(
      id: serializer.fromJson<int>(json['id']),
      gratefulFor: serializer.fromJson<String>(json['gratefulFor']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gratefulFor': serializer.toJson<String>(gratefulFor),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Record copyWith({int id, String gratefulFor, DateTime date}) => Record(
        id: id ?? this.id,
        gratefulFor: gratefulFor ?? this.gratefulFor,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Record(')
          ..write('id: $id, ')
          ..write('gratefulFor: $gratefulFor, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(gratefulFor.hashCode, date.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Record &&
          other.id == this.id &&
          other.gratefulFor == this.gratefulFor &&
          other.date == this.date);
}

class RecordsCompanion extends UpdateCompanion<Record> {
  final Value<int> id;
  final Value<String> gratefulFor;
  final Value<DateTime> date;
  const RecordsCompanion({
    this.id = const Value.absent(),
    this.gratefulFor = const Value.absent(),
    this.date = const Value.absent(),
  });
  RecordsCompanion.insert({
    this.id = const Value.absent(),
    @required String gratefulFor,
    @required DateTime date,
  })  : gratefulFor = Value(gratefulFor),
        date = Value(date);
  static Insertable<Record> custom({
    Expression<int> id,
    Expression<String> gratefulFor,
    Expression<DateTime> date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gratefulFor != null) 'grateful_for': gratefulFor,
      if (date != null) 'date': date,
    });
  }

  RecordsCompanion copyWith(
      {Value<int> id, Value<String> gratefulFor, Value<DateTime> date}) {
    return RecordsCompanion(
      id: id ?? this.id,
      gratefulFor: gratefulFor ?? this.gratefulFor,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gratefulFor.present) {
      map['grateful_for'] = Variable<String>(gratefulFor.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordsCompanion(')
          ..write('id: $id, ')
          ..write('gratefulFor: $gratefulFor, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $RecordsTable extends Records with TableInfo<$RecordsTable, Record> {
  final GeneratedDatabase _db;
  final String _alias;
  $RecordsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _gratefulForMeta =
      const VerificationMeta('gratefulFor');
  GeneratedTextColumn _gratefulFor;
  @override
  GeneratedTextColumn get gratefulFor =>
      _gratefulFor ??= _constructGratefulFor();
  GeneratedTextColumn _constructGratefulFor() {
    return GeneratedTextColumn('grateful_for', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, gratefulFor, date];
  @override
  $RecordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'records';
  @override
  final String actualTableName = 'records';
  @override
  VerificationContext validateIntegrity(Insertable<Record> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('grateful_for')) {
      context.handle(
          _gratefulForMeta,
          gratefulFor.isAcceptableOrUnknown(
              data['grateful_for'], _gratefulForMeta));
    } else if (isInserting) {
      context.missing(_gratefulForMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Record map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Record.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RecordsTable createAlias(String alias) {
    return $RecordsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $RecordsTable _records;
  $RecordsTable get records => _records ??= $RecordsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [records];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$RecordDaoMixin on DatabaseAccessor<AppDatabase> {
  $RecordsTable get records => attachedDatabase.records;
}
