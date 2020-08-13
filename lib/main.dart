import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gratitude/bloc/simple_bloc_observer.dart';
import 'package:gratitude/bloc/record_bloc.dart';
import 'package:gratitude/data/app_database.dart';
import 'package:gratitude/data/record_local_data_source.dart';
import 'package:gratitude/data/record_repository.dart';
import 'package:gratitude/screens/records.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(GratitudeApp());
}

class GratitudeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recordDao = AppDatabase().recordDao;
    final recordLocalDataSource =
        RecordLocalDataSourceImpl(recordDao: recordDao);
    final recordRepository =
        RecordRepositoryImpl(localDataSource: recordLocalDataSource);
    return MaterialApp(
      home: BlocProvider(
        create: (context) => RecordBloc(recordRepository)..add(GetRecords()),
        child: RecordsScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
