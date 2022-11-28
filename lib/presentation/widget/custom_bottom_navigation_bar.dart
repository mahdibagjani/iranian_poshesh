import 'package:flutter/material.dart';

import '../../core/consts/app_image.dart';
import 'bottom_navigation_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int curentIndex=2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 56,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 0.5,
                    color: const Color(0xffBDBDBD).withOpacity(.24)
                  )
                ],
                borderRadius: const BorderRadius.only(
                  
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
          ),
          Container(
            
      height: 86,
            padding: const EdgeInsets.only(left: 23, right: 23, bottom: 8),
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    BottomNavigationItem(
                      iconPath: AppImage.documentForwardIcon,
                      isSelected: curentIndex==0,
                      title: 'ارسال نواقص',
                      onClick: () {
                        setState(() {
                          curentIndex=0;
                        });
                      },
                    ),
                    BottomNavigationItem(
                      iconPath: AppImage.homeIcon,
                      isSelected: curentIndex==1,
                      title: 'خانه',
                      onClick: () {
                          setState(() {
                          curentIndex=1;
                        });
                      },
                    ),
                    BottomNavigationItem(
                      iconPath: AppImage.documentOutlineIcon,
                      isSelected: curentIndex==2,
                      title: 'پرونده های من',
                      onClick: () {
                          setState(() {
                          curentIndex=2;
                        });
                      },
                    ),
                  ],
                ),
          )
        ],
      ),
    );
  }
}
