import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gratitude/data/app_database.dart';

part 'record_event.dart';
part 'record_state.dart';

class RecordBloc extends Bloc<RecordEvent, RecordState> {
  final RecordDao recordDao;

  RecordBloc(this.recordDao) : super(RecordLoading());

  @override
  Stream<RecordState> mapEventToState(
    RecordEvent event,
  ) async* {
    if (event is GetRecords) {
      yield* _mapRecordsLoadedToState();
    } else if (event is RecordAdded) {
      yield* _mapRecordAddedToState(event);
    }
  }

  Stream<RecordState> _mapRecordsLoadedToState() async* {
    yield RecordLoading();
    try {
      final records = await recordDao.getRecords();
      yield RecordLoadedSuccess(records);
    } on Exception {
      yield RecordLoadedError('');
    }
  }

  Stream<RecordState> _mapRecordAddedToState(RecordAdded event) async* {
    if (state is RecordLoadedSuccess) {
      final List<Record> updatedRecords =
          List.from((state as RecordLoadedSuccess).records)..add(event.record);
      yield RecordLoadedSuccess(updatedRecords);
      recordDao.insertRecord(event.record);
    }
  }
}
