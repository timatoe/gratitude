import 'package:moor_flutter/moor_flutter.dart';

part 'app_database.g.dart';

class Records extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get gratefulFor => text().withLength(min: 1, max: 50)();
  DateTimeColumn get date => dateTime()();
}

@UseMoor(tables: [Records])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true)));

  @override
  int get schemaVersion => 1;

  Future<List<Record>> getRecords() => select(records).get();

  Stream<List<Record>> watchRecords() => select(records).watch();

  Future insertRecord(Record record) => into(records).insert(record);

  Future updateRecord(Record record) => update(records).replace(record);
}
