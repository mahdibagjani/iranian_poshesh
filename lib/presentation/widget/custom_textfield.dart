import 'package:flutter/material.dart';
import 'package:iranian/consts/app_image.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({Key? key}) : super(key: key);

  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 343,
      alignment: Alignment.center,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Image.asset(
            AppImage.searchIcon,
            width:24,height:24,
            color: Color(0xff909090) ,
          ),
          Expanded(
              child: Container(
      alignment: Alignment.center,
            child: TextField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 24),
                hintText: 'شناسه پرونده را وارد نمایید',
                hintTextDirection: TextDirection.rtl,
                hintStyle: TextStyle(
                  color: Color(0xff909090)
                )
              ),
            ),
         
          ))
        ],
      ),
    );
  }
}
