import 'package:flutter/material.dart';
import 'package:onewflutter/pages/index_page.dart';

class LoadingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoadingPageState();
  }

}

class LoadingPageState extends State<LoadingPage>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => IndexPage()),
              (route) => route == null);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: Stack(
        children: <Widget>[
          Image.asset("images/blogtouxiang.jpg",fit: BoxFit.cover,)
        ],
      ),
    );
  }

}