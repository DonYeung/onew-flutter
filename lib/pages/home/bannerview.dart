import 'package:flutter/material.dart';
import 'package:onewflutter/api/apiservice.dart';
import 'package:onewflutter/model/banner_msg_entity.dart';
import 'package:onewflutter/pages/webview_page.dart';
import 'package:onewflutter/utils/logutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerView extends StatefulWidget {

  List<BannerMsgData> bannerData = new List();


  BannerView(this.bannerData);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BannerViewState(bannerData);
  }


}

class BannerViewState extends State<BannerView>  with SingleTickerProviderStateMixin{
  ApiService apiService =new ApiService();
  List<BannerMsgData> bannerData = new List();
  TabController _controller;


  BannerViewState(this.bannerData);



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: bannerData == null ? 0 : bannerData.length, vsync: this);
  }



  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  Widget buildItemImageWidget(BuildContext context, int index){
    return new InkWell(
      onTap: (){
        Navigator.of(context).push(new MaterialPageRoute(builder: (context){
          return new WebViewPage(url: bannerData[index].url,title: bannerData[index].title,);
        }));
        
      },
      child: new Container(
        child: new Image.network(bannerData[index].imagepath,fit: BoxFit.fill,),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> items =[];

//    return Swiper(itemBuilder: (BuildContext context,int index){
//      if(bannerData[index] ==null || bannerData[index].imagepath ==null){
//        return new Container(
//          color: Colors.grey[100],
//        );
//      }else{
//        return buildItemImageWidget(context, index);
//      }
//    },
//    itemCount: bannerData.length,
//    autoplay: true,
//    pagination: new SwiperPagination(),);
    if(bannerData!=null&&bannerData.length>0){
      for (int i=0;i<bannerData.length;i++){
        var item = bannerData[i];
        var imgurl =  item.imagepath;
        var title =item.title;
        var link = item.url;
        items.add(new GestureDetector(
          onTap: (){
            _handOnItemClick(link,title);
          },
          child: AspectRatio(aspectRatio: 2.0/1.0,
          child: new Stack(children: <Widget>[
            new Image.network(imgurl,fit: BoxFit.cover,width: 1000.0,),
            new Align(
              alignment: FractionalOffset.bottomCenter,
              child: new Container(width: 1000.0,color: const Color(0x50000000),padding: const EdgeInsets.all(5.0),
              child:  new Text(title,style: new TextStyle(color: Colors.white,fontSize: 15.0),),),
            )
          ],),),
        ));
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

  void _handOnItemClick(itemData,title) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
      return new WebViewPage(url: itemData,title: title);
    }));
  }
}
