import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onewflutter/api/apiservice.dart';
import 'package:onewflutter/pages/cart_page.dart';
import 'package:onewflutter/pages/category_page.dart';
import 'package:onewflutter/pages/home_page.dart';
import 'package:onewflutter/pages/member_page.dart';

class IndexPage extends StatefulWidget{
  _IndexPageState createState() => _IndexPageState();

}
class _IndexPageState extends State<IndexPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('ONews_Flutter')),
      body: currentPage,
      backgroundColor: Color.fromRGBO(244, 245, 245,1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          //type这个是设置底部tab的样式，它有两种样式fixed和shifting，只有超过3个才会有区别，国人的习惯一般是使用fixed的。感兴趣的小伙伴可以自行折腾shifting模式。
          currentIndex: currentIndex,
          items: bottomTabs,
      onTap: (index){
          setState(() {
            currentIndex = index;
            currentPage =tabBodies[currentIndex];
          });
      },),



    );
  }

  final List<BottomNavigationBarItem> bottomTabs =[
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),title: Text('分类')),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart),title: Text('购物车')),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),title: Text('会员中心')),
  ];
  final List tabBodies =[
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];
  int currentIndex = 0;
  var currentPage ;
  
  @override
  void initState() {
    // TODO: implement initState
    currentPage=tabBodies[currentIndex];


    super.initState();
  }

}