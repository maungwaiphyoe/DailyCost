import 'package:daily_cost_new_ui/Model/table_model.dart';
import 'package:daily_cost_new_ui/databasecreator/database_creator.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Addition extends StatefulWidget {
  @override
  _AdditionState createState() => _AdditionState();
}

class _AdditionState extends State<Addition> {
  String _name = "";
  int _amount = 0;
  int _delId = 0;
  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: "Enter Description"),
                  onChanged: (value) {
                    _name = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Amount"),
                  onChanged: (value) {
                    _amount = int.parse(value);
                  },
                ),
                RaisedButton(
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    _insert(_name, _amount);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
              ])),
    );
  }

  void _insert(String name1, int amount1) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name1,
      DatabaseHelper.columnAge: amount1
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }
}
