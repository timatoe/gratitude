import 'package:gratitude/data/app_database.dart';
import 'package:gratitude/data/record_local_data_source.dart';

abstract class RecordRepository {
  Future<List<Record>> getRecords();
  Future addRecord(Record record);
}

class RecordRepositoryImpl implements RecordRepository {
  final RecordLocalDataSource localDataSource;

  RecordRepositoryImpl({this.localDataSource});

  @override
  Future<List<Record>> getRecords() async {
    try {
      return localDataSource.getRecords();
    } on Exception {
      //TODO: handle this properly
      return [];
    }
  }

  @override
  Future addRecord(Record record) async {
    localDataSource.addRecord(record);
  }
}
