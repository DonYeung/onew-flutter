import 'package:flutter/material.dart';
import 'package:onews_flutter/pages/index_page.dart';
import 'package:onews_flutter/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // 设置这一属性即可
      title: 'ONews_Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage()
    );
  }
}
