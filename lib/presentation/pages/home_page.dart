import 'package:flutter/material.dart';
import 'package:iranian/consts/app_image.dart';
import 'package:iranian/presentation/widget/bottom_navigation_item.dart';
import 'package:iranian/presentation/widget/custom_bottom_navigation_bar.dart';

import '../widget/home_page_scaffold_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff1C4870),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.menu),
          )
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24))),
        title: Text(
          'پرونده های من',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
      body: Column(children: [
        Expanded(child: PageView(
          children: [HomePageScaffoldWidget()],
        ),),
        CustomBottomNavigationBar()
      ]),
    );
  }
}
/*


  BottomNavigationBarItem(
                      icon: BottomNavigationItem(
                        iconPath: AppImage.documentForwardIcon,
                        isSelected: false,
                        title: 'ارسال نواقص',
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: BottomNavigationItem(
                        iconPath: AppImage.homeIcon,
                        isSelected: false, 
                        title: 'خانه',
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: BottomNavigationItem(
                        iconPath: AppImage.documentOutlineIcon,
                        isSelected: false,
                        title: 'پرونده های من',
                      ),
                      label: '',
                    ),
/ */