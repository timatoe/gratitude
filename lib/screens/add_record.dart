import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gratitude/data/app_database.dart';
import 'package:gratitude/styles.dart';

class AddRecordScreen extends StatefulWidget {
  final Function addRecordCallback;

  AddRecordScreen(this.addRecordCallback);

  @override
  State<StatefulWidget> createState() => _AddRecordScreenState();
}

class _AddRecordScreenState extends State<AddRecordScreen> {
  final Color color =
      Styles.backgroundColors[Random().nextInt(Styles.backgroundColors.length)];

  TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          color: Color(0xff757575),
          child: Container(
            padding: EdgeInsets.all(32.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                Text('Today I am grateful for...',
                    style: TextStyle(
                        color: color,
                        fontSize: 24,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 16.0,
                ),
                _buildTextField(context),
                SizedBox(
                  height: 32.0,
                ),
                _buildFlatButton(context)
              ],
            ),
          ),
        ));
  }

  TextField _buildTextField(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: textEditingController,
      textAlign: TextAlign.center,
      cursorColor: color,
      decoration: InputDecoration(
        focusColor: color,
        fillColor: color,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
      onSubmitted: (value) {
        final record = Record(
          id: null,
          gratefulFor: textEditingController.text,
          date: DateTime.now(),
        );
        widget.addRecordCallback(record);
        Navigator.pop(context);
      },
    );
  }

  FlatButton _buildFlatButton(BuildContext context) {
    return FlatButton(
      child: Text('Save', style: TextStyle(color: Colors.white)),
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: color)),
      onPressed: () {
        final record = Record(
          id: null,
          gratefulFor: textEditingController.text,
          date: DateTime.now(),
        );
        widget.addRecordCallback(record);
        Navigator.pop(context);
      },
    );
  }
}
