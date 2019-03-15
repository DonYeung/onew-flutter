import 'package:flutter/material.dart';
import 'package:onewflutter/api/apiservice.dart';
import 'package:onewflutter/model/listproject_entity.dart';
import 'package:onewflutter/model/tree_entity.dart';
import 'package:onewflutter/utils/logutil.dart';

class ExplorePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ExplorePageState();
  }

}
class ExplorePageState extends State<ExplorePage> with AutomaticKeepAliveClientMixin{

  List<ListprojectDataData> projectlist = new List();
  List<TreeData> treelist = new List();
  ApiService apiService = new ApiService();

  //listview控制器
  ScrollController _scrollController = ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮
  int _page = 0;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTreelList();
    getListProjectList();
  }


  /**
   * 体系数据
   */
  Future getTreelList() {
    return apiService.getTreelList().then((list) {
      if (list != null && list.length > 0) {
        treelist = list;
      }
      for (var i = 0; i < treelist.length; i++) {
        var item = treelist[i];
        var name = item.name;
        var children = item.children;
        LogUtil.v("getTreelList: " + name);
      }
    });
  }
  /**
   * 获取项目列表
   */
  Future getListProjectList() {
    return apiService.getListProjectList(0).then((list) {
      if (list != null && list.length > 0) {
        projectlist = list;
      }
      for (var i = 0; i < projectlist.length; i++) {
        var item = projectlist[i];
        var title = item.title;
        LogUtil.v("getListProjectList: " + title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text('探索'),
    );
  }



}