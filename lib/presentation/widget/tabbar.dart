import 'package:flutter/material.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 288,
      decoration: BoxDecoration(
          color: Color(0xff1C4870), borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          selectedTextWidget('اعلام خسارت', false),
          selectedTextWidget('بازدید بدنه', true),
          selectedTextWidget('صدور بیمه بدنه', false),
        ],
      ),
    );
  }

  Widget selectedTextWidget(String text, bool isActive) {
    return Container(
      decoration: BoxDecoration(
          color:isActive ? Colors.white: Colors.transparent, borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            color:  isActive ?Color(0xff1C4870):Colors.white ,
            fontWeight: FontWeight.w400,
            fontSize: 12),
      ),
    );
  }
}
