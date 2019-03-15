import 'package:flutter/material.dart';
import 'package:onewflutter/api/apiservice.dart';
import 'package:onewflutter/model/article_list_entity.dart';
import 'package:onewflutter/model/banner_msg_entity.dart';
import 'package:onewflutter/model/listproject_entity.dart';
import 'package:onewflutter/model/tree_entity.dart';
import 'package:onewflutter/pages/home/bannerview.dart';
import 'package:onewflutter/pages/webview_page.dart';
import 'package:onewflutter/utils/DialogUtil.dart';
import 'package:onewflutter/utils/logutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<BannerMsgData> bannerData = new List();
  List<Datas> articlelist = new List();

  ApiService apiService = new ApiService();

  //listview控制器
  ScrollController _scrollController = ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮
  int _page = 0;
  BannerView bannerView;

  //重写keepAlive 为ture ，就是可以有记忆功能了。
  @override
  bool get wantKeepAlive => true;

  //初始化操作
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LogUtil.v("initState");

    getBanner();

    getArticleList();
    LogUtil.init(isDebug: true, tag: 'Don');

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //滑到了底部，加载更多
        _getMore();
      }

      //当前位置是否超过屏幕高度
      if (_scrollController.offset < 200 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 200 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context); //必须添加
    if(articlelist == null ||articlelist.length ==0){
      //展示progress
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }else{
      return new Scaffold(
      body: RefreshIndicator(
        onRefresh: pullToRefresh,
        child: _renderChild(),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
//                showAlertDialog(context);

                showAlertDialog(context);
              },
              child: Icon(Icons.arrow_upward),
            ),
      );
    }
  }

  ListView buildListView() {
    return ListView.separated(
        itemBuilder: _renderRow,
        physics: new AlwaysScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 0.5,
            color: Colors.black26,
          );
        },
        controller: _scrollController,
        //包含轮播图和加载更多
        itemCount: articlelist.length + 2);
  }

  Widget _renderChild() {
    if (articlelist == null) {
      //展示progress
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return buildListView();
    }
  }

  Widget _renderRow(BuildContext context, int index) {
    if (index == 0) {
//        return Container(
//          height: 200,
//          child: new BannerView(bannerData),
//        );
      return new Container(
        height: 200.0,
        child: bannerView,
      );
    }
    if (index < articlelist.length - 1) {
      return ArticleItem(context, index);
    }

    return null;
  }

  /**
   * 首页ArticleItem文章内容
   */
  InkWell ArticleItem(BuildContext context, int index) {
    return new InkWell(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new WebViewPage(
              title: articlelist[index - 1].title,
              url: articlelist[index - 1].link);
        }));
      },
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: <Widget>[
                Text(
                  articlelist[index - 1].author,
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.left,
                ),
                Expanded(
                  child: Text(
                    articlelist[index - 1].niceDate,
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    articlelist[index - 1].title,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3D4E5F),
                    ),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  /**
   * 首页banner
   */
  Future getBanner() {
    return apiService.getBannerMsgData().then((list) {
      if (list != null && list.length > 0) {
        setState(() {
          bannerData = list;
          bannerView = new BannerView(bannerData);
        });
      }
    });
  }



  /**
   * 知识体系下的文章
   */
  Future getArticleList() {
    _page = 0;
    return apiService.getArticleList(_page, 60).then((list) {
      if (list != null && list.length > 0) {
        setState(() {
          articlelist.clear();
          articlelist.addAll(list);
        });
      }
    });
  }



  Future _getMore() {
    _page++;
    return apiService.getArticleList(_page, 60).then((list) {
      if (list != null && list.length > 0) {
        setState(() {
          articlelist.addAll(list);
        });
      } else if (list.length == 0) {
        LogUtil.v("已经没有数据啦！");
        Fluttertoast.showToast(
            msg: "已经没有数据啦！",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            fontSize: 14);
      }
    });
  }

  //刷新控件
  Future<Null> pullToRefresh() async {
    getBanner();
    getArticleList();
    return null;
  }

//  @override
//  void dispose() {
//    super.dispose();
//    _scrollController.dispose();
//    LogUtil.v("dispose");
//  }


  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new DialogUtil(
            title: "帮助",
            message: "当前应用缺少必要的电话、存储空间、位置信息以及相机的权限。请点击设置按钮-权限，打开所需权限",
            negativeText: "取消",
            positiveText: "设置",
            onCloseEvent: (() {
              Navigator.pop(context);// Dismiss the dialog
            }),
            onPositivePressEvent:(() {
              opensetting();
            }),
          );
        });

  }

  Future opensetting() async {
    await PermissionHandler().openAppSettings();
  }

}
