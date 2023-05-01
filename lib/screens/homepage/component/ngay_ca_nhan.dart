// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../constant.dart';

class NgayCaNhan extends StatelessWidget {
  String text;
  String numberText;
  VoidCallback tap;
  NgayCaNhan({
    Key? key,
    required this.text,
    required this.numberText,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Text(
              numberText,
              style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 40,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: k3),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
