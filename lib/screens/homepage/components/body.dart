import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<String> ids = <String>['ST010', 'ST025', 'ST001'];
  final List<String> nameEm = <String>[
    'Vương Tuấn Cường',
    'Nguyễn Phi Hùng',
    'Phạm Ngọc Việt'
  ];
  final List<String> times = <String>['9:00', '10:00', '11:00'];
  final Map<String, List<List<String>>> jsonData = {
    "data": [
      [
        "ST010",
        "Vương Tuấn Cường",
        "Student",
        "21011490@st.phenikaa-uni.edu.vn",
        "Thu, 20 Apr 2023 20:38:05 GMT"
      ],
      [
        "ST022",
        "Nguyễn Hoàng Dương",
        "Student",
        "student@st.phenikaa-uni.edu.vn",
        "Thu, 20 Apr 2023 20:29:15 GMT"
      ],
      [
        "ST025",
        "Nguyễn Phi Hùng",
        "Student",
        "21010598@st.phenikaa-uni.edu.vn",
        "Thu, 20 Apr 2023 19:05:42 GMT"
      ],
      [
        "ST025",
        "Nguyễn Phi Hùng",
        "Student",
        "21010598@st.phenikaa-uni.edu.vn",
        "Thu, 20 Apr 2023 18:23:36 GMT"
      ],
    ]
  };

  @override
  Widget build(BuildContext context) {
    print(jsonData["data"]);
    return Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  elevation: 0,
                  child: ListTile(
                    title: Text(nameEm[index]),
                    subtitle: Text('Student'),
                    leading: Container(
                      child: Center(
                        child: Text(
                          ids[index],
                        ),
                      ),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff5884f3),
                      ),
                    ),
                    trailing: Text(times[index]),
                  ));
            }));
  }
}
