import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gratitude/bloc/record_bloc.dart';
import 'package:gratitude/data/app_database.dart';
import 'package:gratitude/screens/add_record.dart';
import 'package:gratitude/styles.dart';
import 'package:gratitude/widgets/loading_indicator.dart';
import 'package:intl/intl.dart';

class RecordsScreen extends StatelessWidget {
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
            builder: (_) => AddRecordScreen((record) {
              BlocProvider.of<RecordBloc>(context)..add(RecordAdded(record));
            }),
          );
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
              child: BlocBuilder<RecordBloc, RecordState>(
                builder: (context, state) {
                  if (state is RecordLoading) {
                    return LoadingIndicator();
                  } else if (state is RecordLoadedSuccess) {
                    return _buildList(context, state.records);
                  } else if (state is RecordLoadedError) {
                    return Center(child:Text('error'));
                  } else {
                    return Center(child:Text('unknown state'));
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  ListView _buildList(BuildContext context, List<Record> records) {
    return ListView.builder(
      itemCount: records.length,
      itemBuilder: (_, index) {
        final record = records[index];
        return _buildListItem(record);
      },
    );
  }

  Widget _buildListItem(Record record) {
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
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  record.gratefulFor,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
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
