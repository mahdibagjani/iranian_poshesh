import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:iranian/core/consts/app_color.dart';
import 'injection.dart';
import 'presentation/pages/home_page.dart';

void main()async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppColor.primaryColor, // navigation bar color
    statusBarColor: AppColor.primaryColor, // status bar color
  ));
  await configureInjection(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
  
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Yekan'
      ),
      home: const HomePage(),
    );
  }
}

