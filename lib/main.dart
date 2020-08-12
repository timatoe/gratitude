import 'package:flutter/material.dart';
import 'package:gratitude/data/app_database.dart';
import 'package:gratitude/screens/records.dart';
import 'package:provider/provider.dart';

void main() => runApp(GratitudeApp());

class GratitudeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AppDatabase(),
      child: MaterialApp(
        home: RecordsScreen(),
        debugShowCheckedModeBanner: false,
      ),
      dispose: (context, database) => database.close(),
    );
  }
}

