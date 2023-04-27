import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../constant.dart';
import '../../../models/user.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var url = Uri.parse('http://10.20.34.13:8001/timekeeping');
  StreamController<List<User>> _streamController = StreamController.broadcast();
  List<User> _students = [];

  Future<void> _getStudents() async {
    var result = await http.get(url);
    if (result.statusCode == 200) {
      var jsonData = json.decode(result.body)["data"];
      List<User> students = [];
      for (var item in jsonData) {
        students.add(User.fromJson(item));
      }
      _streamController.add(students);
    } else {
      throw Exception('Failed to load students');
    }
  }

  @override
  void initState() {
    super.initState();
    _getStudents();

    Timer.periodic(Duration(seconds: 5), (_) {
      _getStudents();
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<User>>(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _students = snapshot.data!;
          return ListView.builder(
            // reverse: true,
            itemCount: _students.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(5),
                child: Card(
                  elevation: 1,
                  shadowColor: kPrimaryColor,
                  child: ListTile(
                    title: Text(
                      _students[index].name!,
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(_students[index].date!),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
