import 'package:flutter/material.dart';
import 'package:iranian/core/consts/app_color.dart';
import 'package:iranian/core/consts/app_image.dart';

import '../../core/consts/app_strings.dart';

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
      padding:const  EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImage.searchIcon,
            width: 24,
            height: 24,
            color: AppColor.greyHintColor,
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: const TextField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 24),
                  hintText: AppStrings.enterDocId,
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: TextStyle(
                    color: AppColor.greyHintColor,
                  )),
            ),
          ))
        ],
      ),
    );
  }
}
