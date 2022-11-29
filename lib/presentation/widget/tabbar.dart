import 'package:flutter/material.dart';

import '../../core/consts/app_color.dart';
import '../../core/consts/app_strings.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 288,
      decoration: BoxDecoration(
         
                  color: AppColor.primaryColor, borderRadius: BorderRadius.circular(50)),
      padding:const  EdgeInsets.symmetric(vertical: 3, horizontal: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          selectedTextWidget(AppStrings.declarationOfDamage, false),
          selectedTextWidget(AppStrings.visitBody, true),
          selectedTextWidget(AppStrings.issueOfBodyInsurance, false),
        ],
      ),
    );
  }

  Widget selectedTextWidget(String text, bool isActive) {
    return Container(
      decoration: BoxDecoration(
          color:isActive ? Colors.white: Colors.transparent, borderRadius: BorderRadius.circular(50)),
      padding:const  EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            color:  isActive ?AppColor.primaryColor:Colors.white ,
            fontWeight: FontWeight.w400,
            fontSize: 12),
      ),
    );
  }
}
