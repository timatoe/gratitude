import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gratitude/data/app_database.dart';
import 'package:gratitude/screens/add_record.dart';
import 'package:gratitude/styles.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RecordsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  final Color backgroundColor =
      Styles.backgroundColors[Random().nextInt(Styles.backgroundColors.length)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgroundColor,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => AddRecordScreen());
        },
        child: Icon(Icons.edit),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(
              child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 32.0,
                ),
                Text('Gratitude',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    )),
                SizedBox(
                  height: 32.0,
                ),
              ],
            ),
          )),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: _buildRecordList(context),
            ),
          )
        ],
      ),
    );
  }

  StreamBuilder<List<Record>> _buildRecordList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
      stream: database.watchRecords(),
      builder: (context, AsyncSnapshot<List<Record>> snapshot) {
        final records = snapshot.data ?? List();
        return ListView.builder(
          itemCount: records.length,
          itemBuilder: (_, index) {
            final record = records[index];
            return _buildListItem(record, database);
          },
        );
      },
    );
  }

  Widget _buildListItem(Record record, AppDatabase database) {
    return Padding(
      padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: backgroundColor,
              ),
            )),
            child: Row(
              children: [
                Text(
                  "${DateFormat('dd/MM/yyyy').format(record.date)}: ",
                  style: TextStyle(
                    color: backgroundColor,
                    fontSize: 16.0, 
                    fontWeight: FontWeight.w400
                  ),
                ),
                Text(
                  record.gratefulFor,
                  style: TextStyle(
                    fontSize: 16.0, 
                    fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: backgroundColor,
              ),
            )),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(' '),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
