import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gratitude/data/app_database.dart';

part 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  final RecordDao recordDao;

  RecordCubit(this.recordDao) : super(RecordLoading());

  Future<void> getRecords() async {
    try {
      emit(RecordLoading());
      final records = await recordDao.getRecords();
      emit(RecordLoadedSuccess(records));
    } on Exception {
      emit(RecordLoadedError(''));
    }
  }

  Future<void> addRecord(Record record) async {
    if (state is RecordLoadedSuccess) {
      final List<Record> updatedRecords =
          List.from((state as RecordLoadedSuccess).records)..add(record);
      emit(RecordLoadedSuccess(updatedRecords));
      recordDao.insertRecord(record);
    }
  }
}
