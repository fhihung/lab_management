// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:lab_management/constant.dart';
import 'package:lab_management/screens/attendance/attendance_screen.dart';
import 'package:lab_management/screens/homepage/component/home_appbar.dart';
import 'ngay_ca_nhan.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  static DateTime? choosenDate;
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String formattedDate = DateFormat('EEEE, d, MMMM, yyyy').format(today);
    var size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          HomeAppBar(
            icon: Icon(
              Icons.notifications,
              color: kSecondaryColor,
            ),
            textTitle: 'Hi, Hung!',
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text(
            '${formattedDate}',
            style: TextStyle(
                color: kSecondaryColor,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            padding: EdgeInsets.only(bottom: size.height * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NgayCaNhan(
                  tap: () {
                    showBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 200,
                              color: kPrimaryColor,
                              child: Center(
                                child: Text(
                                  'a',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        },
                        backgroundColor: Colors.black);
                  },
                  text: 'Ngày cá nhân',
                  numberText: '6',
                ),
                NgayCaNhan(
                  tap: () {},
                  text: 'Tháng cá nhân',
                  numberText: '9',
                ),
                NgayCaNhan(
                  tap: () {},
                  text: 'Năm cá nhân',
                  numberText: '8',
                )
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Color.fromARGB(255, 235, 235, 235),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Text(
                            'Menu',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.08),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month),
                          SizedBox(width: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Thông tin check-in',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  choosenDate != null
                                      ? 'Selected Date: ${DateFormat('dd/MM/yyyy').format(choosenDate!)}'
                                      : 'Please Choose Date',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                onTap: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  if (picked != null && picked != choosenDate) {
                                    setState(() {
                                      choosenDate = picked;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AttendanceScreen();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              child: Icon(Icons.arrow_circle_right_sharp,
                                  color: kPrimaryColor),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
