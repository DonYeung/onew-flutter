import 'package:flutter/material.dart';
import 'package:onewflutter/api/apiservice.dart';
import 'package:onewflutter/model/banner_msg_entity.dart';

class BannerView extends StatefulWidget {
  var data;


  BannerView(List data) {
    this.data = data;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BannerViewState(data);
  }


}

class BannerViewState extends State<BannerView>  with SingleTickerProviderStateMixin{
  TabController _controller;
  List data;

  BannerViewState(this.data);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: data == null ? 0 : data.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> items =[];
    print('build');
    print(data.length);

    if(data !=null &&data.length>0){
      for(var i =0;i < data.length;i++){
        var item =data[i];
        var imgUrl =item.imagepath;
        var title = item.title;
        var link = item.url;
        items.add(new GestureDetector(
            onTap: () {
              onBannerClick(item);
            },
            child: AspectRatio(
              aspectRatio: 2.0 / 1.0,
              child: new Stack(
                children: <Widget>[
                  new Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                  new Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: new Container(
                      width: 1000.0,
                      color: const Color(0x50000000),
                      padding: const EdgeInsets.all(5.0),
                      child: new Text(title,
                          style: new TextStyle(
                              color: Colors.white, fontSize: 15.0)),
                    ),
                  ),
                ],
              ),
            )));
      }
    }

    return new TabBarView(
      controller: _controller,
      children: items,
    );
  }

  void onBannerClick(item) {
    print('获取adbanner............');

    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
      return ;
    }));
  }
}
