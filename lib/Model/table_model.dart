import 'package:daily_cost_new_ui/databasecreator/database_creator.dart';

class Person {
  int id;
  String name;
  int age;

  Person(this.id, this.name, this.age);

  static Future<List<Person>> query() async {
    var dbHelper = DatabaseHelper.instance;
    final allRows = await dbHelper.queryAllRows();
    var allRow =
        allRows.map((r) => Person(r["_id"], r["name"], r["age"])).toList();
    return allRow;
  }
}
