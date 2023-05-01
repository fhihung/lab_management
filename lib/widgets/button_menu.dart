// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constant.dart';

class ButtonMenu extends StatelessWidget {
  String titleText;
  String subTitle;
  Icon icon;
  double width;
  ButtonMenu({
    Key? key,
    required this.titleText,
    required this.subTitle,
    required this.icon,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        margin: EdgeInsets.only(
            right: size.width * 0.08,
            left: size.width * 0.08,
            bottom: size.height * 0.023),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            SizedBox(
              width: 21,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleText,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: width,
            ),
            Container(
              child: Icon(
                Icons.arrow_circle_right_sharp,
                color: kPrimaryColor,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
