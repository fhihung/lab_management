import 'package:flutter/material.dart';
import '../../constant.dart';
import 'component/body.dart';
import 'component/home_appbar.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      drawer: Drawer(),
      body: Body(),
    );
  }
}
