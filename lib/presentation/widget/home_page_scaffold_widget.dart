import 'package:flutter/material.dart';
import 'package:iranian/presentation/widget/tabbar.dart';

import 'custom_textfield.dart';
import 'main_card.dart';

class HomePageScaffoldWidget extends StatefulWidget {
  const HomePageScaffoldWidget({ Key? key }) : super(key: key);

  @override
  _HomePageScaffoldWidgetState createState() => _HomePageScaffoldWidgetState();
}

class _HomePageScaffoldWidgetState extends State<HomePageScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
   padding: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const SizedBox(height: 24,),
        Tabbar(),
      
        const SizedBox(height: 16,),
        CustomTextfield(),
        const SizedBox(height: 16,),
        MainCard()
      ]),
    );
  }
}