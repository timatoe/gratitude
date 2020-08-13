import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gratitude/bloc/simple_bloc_observer.dart';
import 'package:gratitude/cubit/record_cubit.dart';
import 'package:gratitude/data/app_database.dart';
import 'package:gratitude/screens/records.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(GratitudeApp());
}

class GratitudeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) =>
            RecordCubit(AppDatabase().recordDao)..getRecords(),
        child: RecordsScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
