import 'package:gratitude/data/app_database.dart';

abstract class RecordLocalDataSource {
  Future<List<Record>> getRecords();
  Future addRecord(Record record);
}

class RecordLocalDataSourceImpl implements RecordLocalDataSource {
  final RecordDao recordDao;

  RecordLocalDataSourceImpl({this.recordDao});

  @override
  Future<List<Record>> getRecords() async {
    final records = await recordDao.getRecords();
    return records;
  }

  @override
  Future addRecord(Record record) async {
    recordDao.insertRecord(record);    
  }
}
