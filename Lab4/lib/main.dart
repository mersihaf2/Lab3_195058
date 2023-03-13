import 'package:flutter/material.dart';
import './courseList.dart';
import './newCourse.dart';
import 'package:studentorganizer/models/course.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          accentColor: Colors.blue,
          errorColor: Colors.red,
          fontFamily: 'Quicksand'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<Course> _courseList = [
    Course(
        name: 'Informaciska bezbednost',
        date: DateTime.now(),
        id: DateTime.now().toString()),
    Course(
        name: 'Mobilni informaciski sistemi',
        date: DateTime.now(),
        id: DateTime.now().toString()),
  ];

  void _startAddingNewCourse(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(onTap: () {}, child: NewCourse(_addNewCourse));
      },
    );
  }

  void _addNewCourse(String name, DateTime date) {
    setState(() {
      _courseList
          .add(Course(name: name, date: date, id: DateTime.now().toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text('Student Organizer'),
          actions: [
            IconButton(
                onPressed: () => _startAddingNewCourse(context),
                icon: Icon(Icons.add))
          ],
        ),
        body: Column(children: [
          Container(child: CourseList(_courseList)),
        ]),
      ),
    );
  }
}
