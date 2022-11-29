import 'package:flutter/material.dart';
import 'package:iranian/core/consts/app_strings.dart';

import '../../core/consts/app_color.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
                  color: AppColor.primaryColor,width: 2),
          boxShadow: [
            BoxShadow(
                color: const Color(0xffC6C6C6).withOpacity(.24), blurRadius: 8)
          ]),
      child: const Text(
       AppStrings.enterToDocPage,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      ),
    );
  }
}
