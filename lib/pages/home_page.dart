import 'package:flutter/material.dart';
import 'package:onewflutter/api/apiservice.dart';
import 'package:onewflutter/common/common.dart';
import 'package:onewflutter/model/banner_msg_entity.dart';
import 'package:onewflutter/pages/home/bannerview.dart';
import 'package:onewflutter/utils/logutil.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<BannerMsgData>> bannerData;

  BannerView bannerView;
  ScrollController scrollController = new ScrollController();
  ApiService apiService = new ApiService();

  List listData = new List();
  var curPage = 0;
  var listTotalSize = 0;


  //初始化操作
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBanner();
//    _getData();
//    _getBanner();
    getTreelList();
    LogUtil.init(isDebug: true, tag: 'Don');
//    getHomeList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget listView = new ListView.builder(
      itemBuilder: (context, i) => addHeader(1),
      controller: scrollController,
    );
    return new RefreshIndicator(child: listView, onRefresh: pullToRefresh);
  }

  //请求广告横幅
  Future getBanner() {

    return apiService.getBannerMsgData().then((list) {

      LogUtil.v("请求广告横幅: " + list.toString());
      if(list!=null&&list.length>0){
        bannerView = new BannerView(list);
      }
      for (var i = 0; i < list.length; i++) {
        var item = list[i];
        var title = item.title;
        LogUtil.v("请求getBanner: " + title);
      }

    });
  }



  Future getTreelList(){
    return apiService.getTreelList().then((list){
      LogUtil.v("请求tree列表: " + list.toString());
//      for (var i = 0; i < list.length; i++) {
//        var item = list[i];
//        var name = item.name;
//        LogUtil.v("请求tree列表title: " + name);
//      }
    });
  }


  Future getArticleList(){
    return apiService.getArticleList(0).then((list){
      LogUtil.v("请求文章列表: " + list.toString());
//      for (var i = 0; i < list.length; i++) {
//        var item = list[i];
//        var title = item.title;
//        LogUtil.v("请求getBanner: " + title);
//      }

    });
  }

//  Future<Null> _getData() async {
//    apiService.getSystemTree((SystemTreeModel _systemTreeModel) {
//      setState(() {
//        _datas = _systemTreeModel.data;
//        for(var i =0;i < _datas.length;i++) {
//          var item = _datas[i];
//          var name =item.name;
//          LogUtil.v("请求_getData: " + name);
//        }
//
//      });
//    });
//  }


  //添加轮播图
  Widget addHeader(int i) {
    var container = new Container(height: 180, child: bannerView);
    Row content = new Row(
      children: <Widget>[
        new Text('广告轮播图'),
        new Expanded(
            child: new Text('最新轮播图',
                softWrap: true,
                textAlign: TextAlign.left,
                maxLines: 1,
                style: TextStyle(color: Color.fromARGB(255, 255, 200, 200))))
      ],
    );
    Column column = new Column(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.all(0.0),
          child: container,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
          child: content,
        )
      ],
    );

    return new Card(
      elevation: 0.1,
      child: new InkWell(
        child: column,
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return;
          }));
        },
      ),
    );
  }

  //刷新控件
  Future<Null> pullToRefresh() async {
//    getBanner();
//    getArticleList();
    return null;
  }

//  Widget buildItem(int i) {
//    //添加header头部
//    if (i == 0) {
//      return addHeader(i);
//    }
//    i -= 1;
//    var itemData = listData[i];
//    //添加没有更多
//    if (itemData is String && itemData == Constants.complete) {
//      return new EndLine();
//    }
//    //添加博文item
//    return new ArticleItem(itemData);
//  }

}
