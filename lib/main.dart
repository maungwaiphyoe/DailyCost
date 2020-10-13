import 'package:daily_cost_new_ui/Model/table_model.dart';
import 'package:daily_cost_new_ui/Sub_Page/addition_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Person> person = [];

  @override
  void initState() {
    super.initState();
    query();
  }

  query() async {
    var allrowsss = await Person.query();
    person.addAll(allrowsss);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget'),
      ),
      body: Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: person.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                    height: 50,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text(person[index].id.toString())),
                            Expanded(child: Text(person[index].name)),
                            Expanded(child: Text(person[index].age.toString()))
                          ],
                        ),
                        Divider(
                          color: Colors.red,
                          thickness: 5,
                        )
                      ],
                    )),
                onTap: () {
                  print(index);
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Addition()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        color: Colors.blue,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.money_off,
                  color: Colors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
