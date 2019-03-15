import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:onewflutter/common/common.dart';
import 'package:onewflutter/dioUtil.dart';
import 'package:onewflutter/model/article_list_entity.dart';
import 'package:onewflutter/model/banner_msg_entity.dart';
import 'package:onewflutter/model/listproject_entity.dart';
import 'package:onewflutter/model/tree_entity.dart';
import 'package:onewflutter/utils/logutil.dart';

class ApiService {
  Future<List<BannerMsgData>> getBannerMsgData() async {
    print('开始获取banner数据...............');

    Response response = await DioUtil.getInstance().get(Constant.BANNER);
    List<BannerMsgData> banResModellist;
    if (response.data != null) {
      //响应成功
      banResModellist = BannerMsgEntity.fromJson(response.data).data.toList();
      LogUtil.v("获取getBannerMsgData成功：" + banResModellist.length.toString());
    } else {
      //出问题
    }
    return banResModellist.toList();
  }

  Future<List<TreeData>> getTreelList() async {
    print('开始获取getTreelList数据...............');

    List<TreeData> treedatalist;
    Response response = await DioUtil.getInstance().get(Constant.TREE);
    LogUtil.e("打印data:" + response.toString());
    if (response.data != null) {
      treedatalist = Tree.fromJson(response.data).data.toList();
      LogUtil.v("获取treedatalist length：" + treedatalist.length.toString()); //37
    }
    return treedatalist;
  }

  Future<List<Datas>> getArticleList(int _page, int cid) async {
    print('开始获取getArticleList数据...............');
    String url = Constant.ARTICLE_LIST + "/$_page/json" + "?cid=$cid";
//    http://www.wanandroid.com/article/list/0/json?cid=60
    LogUtil.e("开始获取getArticleList数据 url为：" + url);

    Response response = await DioUtil.getInstance().get(url);

    List<Datas> articlelist;

    if (response.data != null) {
      //响应成功
      articlelist = ArticleList.fromJson(response.data).data.datas.toList();
      LogUtil.v("获取getArticleList成功：" + articlelist.length.toString());
    } else {
      //出问题
    }
    return articlelist.toList();
  }

  Future<List<ListprojectDataData>> getListProjectList(int _page) async {
    print('开始获取getListProjectList数据...............');
    String url = 'http://www.wanandroid.com/' +
        Constant.ARTICLE_LISTPROJECT +
        "/$_page/json";
    Response response = await DioUtil.getInstance().get(url);
    LogUtil.e("开始获取getListProjectList数据 url为：" + url);
    List<ListprojectDataData> projectlist;
    if (response.data != null) {
      projectlist =
          ListprojectEntity.fromJson(response.data).data.datas.toList();
      LogUtil.v("获取getListProjectList成功：" + projectlist.length.toString());
    } else {}
    return projectlist;
  }

  //demo
  Future getHttp(String TypeText) async {
    var data = {'name': TypeText};

    var response = await DioUtil.getInstance().get(
        "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian",
        data: data);
    return response;
  }
}
